import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pbserver.dart';

void main() {
  test(
      'Given client signs in When the page loads Then client object should be populated',
      () async {
    // TODO: Implement test
    final Client rssClient =
        Client(id: 123456, email: "johndoe@email.com", name: "John Doe");

    expect(rssClient.email, "johndoe@email.com");
  });
}
