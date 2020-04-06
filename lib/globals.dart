import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsem_edu/common/uuid.dart';

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
  String uuid = "";
  String globalUserId = "";
  static const String _tokenKey = "token";
  static const String _uuidKey = "uuid";
  static const String _userIdKey = "userId";

  Future<void> init() async {
    token = await getToken();
    uuid = await getUuid();
  }

  Future<void> saveToken(String _token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = _token;
    WebService.getInstance().addTokenToHeaders(token);
    await prefs.setString(_tokenKey, _token);
  }

  Future<void> saveUserId(String _userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUserId = _userId;
    await prefs.setString(_userIdKey, _userId);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(_tokenKey) ?? "";
    return token;
  }

  Future<String> getUuid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uuid = prefs.getString(_uuidKey) ?? "";

    if(uuid.isEmpty) {
      uuid = await saveUuid(Uuid().generateV4());
    }

    return uuid;
  }

  Future<String> saveUuid(String _uuid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uuidKey, _uuid);
    return uuid;
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUserId = prefs.getString(_userIdKey) ?? "";
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
