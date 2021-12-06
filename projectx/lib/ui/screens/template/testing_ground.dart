import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/factories/dialog_controller.dart';
import 'package:projectx/ui/screens/template/dialogs/dialog1.dart';
import 'package:projectx/ui/screens/template/dialogs/dialog_login.dart';
import 'package:projectx/ui/screens/template/dialogs/dialog_login_otp.dart';

import 'dialogs/dialog_login_alt.dart';

class UITestingGrounds extends StatelessWidget {
  UITestingGrounds({Key? key}) : super(key: key);

  DialogController dialogController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UI Testing Grounds"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Text((dialogController.result.value as Map?)?.toString() ?? "")),
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () async {
                      dialogController.result.value = await Get.dialog(Dialog1(), useSafeArea: true);
                    },
                    child: const Text("Dialog"),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () async {
                      dialogController.result.value = await Get.dialog(DialogLoginOTP(), useSafeArea: true);
                    },
                    child: const Text("Dialog OTP"),
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          dialogController.result.value = await Get.dialog(DialogLogin(), useSafeArea: true);
                        },
                        child: const Text("Dialog Login"),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          dialogController.result.value = await Get.dialog(DialogLoginAlt(), useSafeArea: true);
                        },
                        child: const Text("Dialog Alt"),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
