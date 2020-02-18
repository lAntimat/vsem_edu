import 'package:shared_preferences/shared_preferences.dart';

import 'network/web_service.dart';

class Globals {
  static Globals _instance;

  static Globals getInstance() {
    if (_instance == null) {
      _instance = Globals();
      return _instance;
    }
    return _instance;
  }

  String token = "";
  String globalUserId = "";
  static const String tokenKey = "token";
  static const String userIdKey = "userId";

  Future<void> saveToken(String _token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = _token;
    WebService.getInstance().addTokenToHeaders(token);
    await prefs.setString(tokenKey, _token);
  }

  Future<void> saveUserId(String _userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUserId = _userId;
    await prefs.setString(userIdKey, _userId);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(tokenKey) ?? "rhpnff7t7mg7f5l0bc940fb12eb3602fefdde66cdf14819";
    return token;
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUserId = prefs.getString(userIdKey) ?? "";
    return globalUserId;
  }

  Future<void> savePushToken(String pushToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("pushToken", pushToken);
  }

  Future<String> getPushToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("pushToken") ?? "";
  }

  void clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    token = "";
    globalUserId = "";
  }
}
