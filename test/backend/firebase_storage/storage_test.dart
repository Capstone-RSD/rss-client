import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockFirebaseStorage();
  const filename = 'DAAsset_1.png';
  final storageRef = storage.ref().child(filename);
  final localImage = await rootBundle.load("assets/images/$filename");
  final task = await storageRef.putData(localImage.buffer.asUint8List());
  // Prints 'gs://some-bucket//someimage.png'.
  // print(task.ref.fullPath);

  test('Upload to Firebase Cloud Storage ', () {
    expect(task.ref.fullPath, isNotEmpty);
  });
}
