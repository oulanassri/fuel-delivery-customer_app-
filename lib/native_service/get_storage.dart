import 'package:get_storage/get_storage.dart';

class UserStorage {
  final storage = GetStorage();

  void save(String key, String value)  {
     storage.write(key, value);
  }

  String read(String key)  {
    return  storage.read(key);
  }
  void delete(String key)  {
      storage.write(key,'');
  }
}
