import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'utils/constants.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  late String token;

  bool isAuthenticated(){
    if(_isAuthenticated == true || getToken().toString() != ''){
      return true;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    final response = await http.post(Uri.parse('$API_URL/login'), body: {
      'email': email,
      'password': password,
      //'device_name': await getDeviceId(),
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 201) {
      String token = response.body;
      print(token);
      await saveToken(token);
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }

    if (response.statusCode == 401) {
      print(response.body);
      return false;
    }

    return false;
  }

  Future<bool> register(
      String name, String email, String password, String passwordConf ,String udid, String fcmtok) async {
    final response = await http.post(Uri.parse('$API_URL/register'), body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConf,
      'udid': udid,
      'fcmtoken': fcmtok,

    }, headers: {
      'Accept': 'application/json',
    });
    print("register response");
    print(response.body);
    if (response.statusCode == 201) {
      String token = response.body;
      print(token);
      await saveToken(token);
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }

    if (response.statusCode == 401) {
      print("printing response body");
      print(response.body);
      return false;
    }
    print("printing response body");
    print(response.body);
    return false;
  }

  getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        return build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        return data.identifierForVendor;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') as String;
  }

  logout() async {
    token = await getToken();
    token = token.toString();
    print("token been sent with logout is");
    print(token);
    final response = await http.post(Uri.parse('$API_URL/logout'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("Response from logout route");
    print(response.body);
    _isAuthenticated = false;
    notifyListeners();
  }

  authenticate(){
    _isAuthenticated = true;
    notifyListeners();
  }

}
