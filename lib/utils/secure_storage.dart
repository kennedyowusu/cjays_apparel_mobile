import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(
      key: key,
      value: value,
    );
    return writeData;
  }

  Future<String?> readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}
