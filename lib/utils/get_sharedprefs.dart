import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage {
  Future refreshStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    // storage.clear();
    print('storage is reloading');
  }

  Future clearStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    storage.clear();
  }
}
