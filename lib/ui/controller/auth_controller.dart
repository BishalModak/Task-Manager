import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/data/models/user_model.dart';

class AuthController {
  static UserModel? userModel;
  static String? accessToken;

  static Future<void> saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
    await sharedPreferences.setString('token', token);
    userModel = model;
    accessToken = token;
  }

  static Future<void> getUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userModel = UserModel.fromJson(jsonDecode(sharedPreferences.getString('user-data')!));
    accessToken = sharedPreferences.getString('token');
  }

  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
