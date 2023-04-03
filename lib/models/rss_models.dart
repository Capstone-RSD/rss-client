import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/latlng.pb.dart';
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';

class RSSClient extends ChangeNotifier {
  Client _client = Client();

  Client get client => _client;

  set client(Client value) {
    _client = value;
  }

  static const rssChannel = MethodChannel("publishEvent");
  static const rssPresChannel = MethodChannel("publishPresEvent");

  /// If the user has not enabled location services, request permission and open the location settings.
  /// If the user has enabled location services, return the current location
  ///
  /// Returns:
  ///   A Future<Position> object.
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      LocationPermission locationPermission =
          await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        locationPermission = await Geolocator.requestPermission();
        await Geolocator.openLocationSettings();

        return Future.error(
            "Location permissions has been denied. Please enable for functionality");
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  ///
  /// This function will check if the user has location permissions, if not it will request them, then
  /// it will check if the location service is enabled, if not it will open the location settings, then
  /// it will start a stream of location updates
  ///
  /// Returns:
  ///   A stream of location data.
  void liveLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      LocationPermission locationPermission =
          await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        locationPermission = await Geolocator.requestPermission();
        await Geolocator.openLocationSettings();

        return Future.error(
            "Location permissions has been denied. Please enable for functionality");
      }
    }

    late LocationSettings locationSettings;
// Sets location permissions depending on platform
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "RSSClient will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            // notificationIcon: AndroidResource(name: name),
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.best,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
          accuracy: LocationAccuracy.best, distanceFilter: 10);
    }

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((event) {
      client.damageLocation = DamageLocation(
          latLng: LatLng(longitude: event.longitude, latitude: event.latitude));
      client.speed = event.speed;
      debugPrint("Longitude: ${event.longitude}");
      debugPrint("Latitude: ${event.latitude}");
      log("Speed: ${event.speed}");
    });
  }

  /// It takes the client object, converts it to a json string, and passes it to the native code
  Future publishToRSSTopic() async {
    // postRequest();
    var methodRes;
    print("Client: ${client.toProto3Json()}");
    // if (kDebugMode) {}
    try {
      methodRes = await rssChannel.invokeMethod("publishEvent",
          {"client": json.encode(client.toBuilder().toProto3Json())});
    } on PlatformException catch (e) {
      print(e.message);
    }

    // return methodRes;
  }

  /// A function to publish system state messages to
  ///
  /// Publishes to the __RSSPresTopic__ topic
  ///
  /// Takes a **String** message as  parameter
  Future publishToRSSPresTopic(String message) async {
    var methodRes;
    if (kDebugMode) {
      print("message: $message");
    }
    try {
      methodRes = await rssPresChannel
          .invokeMethod("publishPresEvent", {"rss_state": "Stage: $message"});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}
