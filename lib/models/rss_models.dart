import 'package:flutter/material.dart';
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
    notifyListeners();
  }

  static const String TOPIC = "/rss_topic";
  static const String CLUSTER_ID = "/lkc-d91ond";
  static const int SCHEMA_ID = 100001;
  static const String API_KEY =
      "NzJOM1dWWFJLU1AzQUZTQTpvTkU2eWVyYkNSSStVR05XalIwVkhJSFNUQzJBbVp2NmlBRW5malp6Y0gvMWM3NHY3UDJnSVltd3hlRnJ3eFc4";

  static const rssChannel = MethodChannel("publishEvent");

  Future<Position> getCurrentLocation() async {
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
        return Future.error(
            "Location permissions has been denied. Please enable for functionality");
      }
    }

    notifyListeners();

    return await Geolocator.getCurrentPosition();
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 0);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((event) {
      debugPrint("Longitude: ${event.longitude}");
      debugPrint("Latitude: ${event.latitude}");
    });
  }

  Future<void> uploadImage(Client rssClient) async {
    // final file = File();
    final firebasePath = '${rssClient.email}/rss';
    // final storageRef = FirebaseStorage.instance.ref().child(firebasePath);
    // storageRef.putFile(blob);

    // Uploading to firebase
    // UploadTask task;
    // final snapshot = await task.whenComplete(() => null);
    // final urlDownload = await
  }

  Future<bool> publishToKafka() async {
    var methodRes;
    // Map<String, dynamic> result=[];
    try {
      print(rssClient.toProto3Json());
      methodRes = await rssChannel.invokeMethod("publishEvent",
          {"client": rssClient.toBuilder().toProto3Json().toString()});
      print(methodRes.toString());

      // result= jsonDecode(methodRes);
      // print("Result from method channel $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
    // return result['errorCode'];
    return true;
  }
}
