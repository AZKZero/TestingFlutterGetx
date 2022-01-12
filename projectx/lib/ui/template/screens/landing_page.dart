import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/user_controller.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key) {
    _userController.loaded.listen((p0) {
      if (p0) {
        if (_userController.user.value != null) {
          Future.delayed(const Duration(seconds: 1), () {
            Get.offAndToNamed('/home');
          });
        } else {
          Get.offAndToNamed('/login');
        }
      }
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
