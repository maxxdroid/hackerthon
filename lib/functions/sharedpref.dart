import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
  static String adminIDKey = 'UserIdKey';

  //Save

  Future<bool> saveAdminID(String getAdminId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(adminIDKey, getAdminId);
  }

  static String adminNameKey = 'AdminNameKey';

  Future<bool> saveAdminName(String getAdminName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(adminNameKey, getAdminName);
  }

  //get

  Future<String?> getAdminID() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(adminIDKey);
  }

  Future<String?> getAdminName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(adminIDKey);
  }
}