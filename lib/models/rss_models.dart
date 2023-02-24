import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';

class RSSClient extends ChangeNotifier {
  static const String URL = "pkc-3w22w.us-central1.gcp.confluent.cloud:443";
  static const String PATH = "/kafka/v3/clusters";

  Client _rssClient = Client();

  Client get rssClient => _rssClient;

  set rssClient(Client value) {
    _rssClient = value;
  }

  static const String TOPIC = "/rss_topic";
  static const String CLUSTER_ID = "/lkc-d91ond";
  static const int SCHEMA_ID = 100001;
  static const String API_KEY =
      "NzJOM1dWWFJLU1AzQUZTQTpvTkU2eWVyYkNSSStVR05XalIwVkhJSFNUQzJBbVp2NmlBRW5malp6Y0gvMWM3NHY3UDJnSVltd3hlRnJ3eFc4";

  static const rssChannel = MethodChannel("rssChannel");

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
          "Location service has been disabled. Please enable for functionality");
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        await Geolocator.openLocationSettings();

        return Future.error(
            "Location permissions has been denied. Please enable for functionality");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
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
                "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
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
      debugPrint("Longitude: ${event.longitude}");
      debugPrint("Latitude: ${event.latitude}");
    });
  }
}
