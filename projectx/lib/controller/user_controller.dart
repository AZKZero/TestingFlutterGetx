import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectx/ui/template/screens/home/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/models/server/user.dart';

class UserController extends GetxController {
  Rxn<User> user = Rxn(null);
  RxBool loaded = false.obs;

  UserController() {
    loadUser();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<UserController> loadUser() async {
    loaded.value = false;
    user.value = await _prefs.then((SharedPreferences prefs) {
      var userString = prefs.getString("user");
      return userString != null && userString.isNotEmpty ? User.fromJson(jsonDecode(userString)) : null;
    });
    loaded.value = true;
    return this;
  }

  saveUser([bool reset = false, User? userX]) async {
    await _prefs.then((SharedPreferences prefs) => prefs.setString("user", userX != null ? jsonEncode(userX.toJson()) : ""));
    if (reset) Get.offNamedUntil('/home', ModalRoute.withName('/home'));
  }
}
