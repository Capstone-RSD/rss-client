import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';

class RSSClient extends ChangeNotifier {
  static const String URL =
      "pkc-v12gj.northamerica-northeast2.gcp.confluent.cloud:443";
  static const String PATH = "/kafka/v3/clusters";

  Client _client = Client();

  Client get client => _client;

  set client(Client value) {
    _client = value;
    notifyListeners();
  }

  static const String TOPIC = "/rss_topic";
  static const String CLUSTER_ID = "/lkc-j375wq";
  static const int SCHEMA_ID = 100001;
  static const String API_KEY =
      "QkhKTEtLNDY0TlE2RUk2NDp3OHBkWWVTSEdDRml6UEFodG9BL2I2ZjdkN1o1c29VTTBxcTFydE9QNlU2Um9IWnB1SHllWnFFUlFYNnptdDQ3";

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

  Future publishToKafka() async {
    // postRequest();
    var methodRes;
    // Map<String, dynamic> result=[];
    print(json.encode(client.toProto3Json()).toString());
    try {
      methodRes = await rssChannel.invokeMethod(
          "publishEvent", {"client": json.encode(client.toProto3Json())});
      // if (kDebugMode) {
      //   print(methodRes.toString());
      // }

      // result= jsonDecode(methodRes);
      // print("Result from method channel $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
    // return result['errorCode'];
    // return true;
  }

  Future<http.Response> postRequest() async {
    var url = Uri.https("$URL", "$PATH$CLUSTER_ID/topics$TOPIC/records");

    Map data = client.writeToJsonMap();
    //encode Map to JSON
    var body = json.encode(client.toProto3Json());

    print(body);

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Basic $API_KEY"
        },
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
}
