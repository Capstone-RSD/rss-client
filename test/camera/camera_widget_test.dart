import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/datetime.pb.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/latlng.pbserver.dart';
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';
import 'package:rssclient/models/rss_models.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Client client = Client();
  List<BlobSrc> blobSrcList = [];

  // await initFirebase();

  group('Kafka Tests', () {
    setUpAll(() {
      blobSrcList.add(BlobSrc(
          blobUrl:
              "gs://rss-client-21d3b.appspot.com/users/WPMLS7CxD9Vzbc1ptzIhuvjraXm1/uploads/1676645216902559.jpg",
          datetimeCreated: DateTime(),
          image: "image"));
      client = Client(
          id: 123456,
          email: "johndoe@email.com",
          name: "John Doe",
          blobs: blobSrcList,
          damageLocation: DamageLocation(
              latLng: LatLng(latitude: 43.945958, longitude: -78.893548)));
    });

    test('Checks if the client is initialized', () {
      expect(client.isInitialized(), true);
    });

    test('Given the User taps Send Post an event is published to kafka',
        () async {
      RSSClient rssClient = RSSClient();
      rssClient.client = client;
      print(client.toProto3Json().toString());
      mockPackageInfo(rssClient);
    });
  });
  // RSSClient rssClient = RSSClient();
  // rssClient.rssClient = client;
  // mockPackageInfo(rssClient);
}

void mockPackageInfo(RSSClient client) {
  const channel = MethodChannel('publishEvent');

  handler(MethodCall methodCall) async {
    if (methodCall.method == 'publishEvent') {
      methodCall.arguments(client.client.toBuilder().toProto3Json().toString());
      // return client.rssClient.toBuilder().toProto3Json().toString();
    }
    return null;
  }

  TestWidgetsFlutterBinding.ensureInitialized();

  TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, handler);
}
