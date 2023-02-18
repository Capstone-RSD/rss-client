import 'package:flutter_test/flutter_test.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/datetime.pb.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/latlng.pbserver.dart';
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';
import 'package:rssclient/models/rss_models.dart';

void main() {
  Client client = Client();
  List<BlobSrc> blobSrcList = [];

  TestWidgetsFlutterBinding.ensureInitialized();

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
      rssClient.rssClient = client;
      bool res = await rssClient.publishToKafka();
      expect(res, true);
    });
  });
}
