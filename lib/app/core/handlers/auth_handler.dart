import 'package:flutter/material.dart';
import 'package:login_api/app/core/services/registry_service/di.dart';
import 'package:login_api/app/core/services/secure_storage.dart';
import 'package:login_api/app/core/utils/app_logger.dart';
import 'package:login_api/app/modules/authentication/data/dto/login_dto.dart';


class AuthHandler {
  AuthHandler._instance();
  static final AuthHandler ref = AuthHandler._instance();

  // factory AuthHandler() => ref;
  User? user;
  String? acessToken;
  bool didLogOut = false;

  Prefs prefs = locator<Prefs>();
  
  Future<bool> get isLoggedIn async {
    try {
      String? token = await prefs.fetchToken();
      return token != null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setupUser(User? user, bool isRemember) async {
    this.user = user;
    if (isRemember) {
      await prefs.storeUser(user);
    }
    didLogOut = false;
  }

  Future<void> storeToken(String? acessToken, bool isRemember) async {
    this.acessToken = acessToken;
    appLog("Saved Token $acessToken");
    if (isRemember) {
      await prefs.storeToken(acessToken);
    }
  }

  Future<void> init(BuildContext context) async {
    try {

      didLogOut = false;
      user = await prefs.fetchUser();
      acessToken = await prefs.fetchToken();

      appPrint('[User]: $user');
      appPrint('[AccessToken]: $acessToken');


    } catch (e) {
      appPrint(e);
    }
  }

  void resetAuth() {
    didLogOut = false;
  }

  Future<void> logout() async {
    /// UseCase [didLogOut]: Avoid re-logouts on multiple Ghost login attempts.
    try {
      if (didLogOut) return;
      await prefs.deleteUser();
      await prefs.deleteToken();

      didLogOut = true;
      // AppRouterGo.pushRemoveUntil(loginScreen);
    } catch (e) {
      appPrint(e);
    }
  }
}