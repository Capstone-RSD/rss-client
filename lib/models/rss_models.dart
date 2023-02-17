import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';

const String URL = "pkc-3w22w.us-central1.gcp.confluent.cloud:443";
const String PATH = "/kafka/v3/clusters";

final Client rssClient =
    Client(id: 123456, email: "johndoe@email.com", name: "John Doe");
const String TOPIC = "/rss_topic";
const String CLUSTER_ID = "/lkc-d91ond";
const int SCHEMA_ID = 100001;
const String API_KEY =
    "NzJOM1dWWFJLU1AzQUZTQTpvTkU2eWVyYkNSSStVR05XalIwVkhJSFNUQzJBbVp2NmlBRW5malp6Y0gvMWM3NHY3UDJnSVltd3hlRnJ3eFc4";

const rssChannel = MethodChannel("rssChannel");

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
      return Future.error(
          "Location permissions has been denied. Please enable for functionality");
    }
  }
  return await Geolocator.getCurrentPosition();
}

void _liveLocation() {
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
