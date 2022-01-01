import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/user_controller.dart';
import 'package:projectx/ui/template/screens/bottom_nav.dart';
import 'package:projectx/ui/template/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key) {
    _userController.loaded.listen((p0) {
      if (p0) Get.offAndToNamed(_userController.user.value != null ? '/home' : '/login');
    });
  }

  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(
        builder: (p0) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              value: null,
            ),
          );
        },
      ),
    );
  }
}
