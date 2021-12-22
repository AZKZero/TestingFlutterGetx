import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/factories/dialog_controller.dart';
import 'package:projectx/main.dart';
import 'package:projectx/ui/template/screens/bottom_nav.dart';
import 'package:projectx/ui/template/screens/checklist.dart';
import 'package:projectx/ui/template/dialogs/dialog1.dart';
import 'package:projectx/ui/template/dialogs/dialog_login.dart';
import 'package:projectx/ui/template/dialogs/dialog_login_alt.dart';
import 'package:projectx/ui/template/dialogs/dialog_login_otp.dart';
import 'package:projectx/ui/template/dialogs/dialog_wrapper.dart';
import 'package:projectx/ui/template/screens/feed.dart';
import 'package:projectx/ui/template/screens/image_gallery.dart';
import 'package:projectx/ui/template/screens/login_screen.dart';
import 'package:projectx/ui/template/screens/profile_screen.dart';
import 'package:projectx/ui/template/screens/settings.dart';
import 'package:projectx/ui/template/screens/text_editor_screen.dart';

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
          child: SingleChildScrollView(
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
                        dialogController.result.value = await Get.dialog(DialogWrapper(child: DialogLoginOTP()), useSafeArea: true);
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
                        dialogController.result.value = await Get.dialog(DialogWrapper(child: DialogLoginAlt()), useSafeArea: true);
                      },
                      child: const Text("Dialog Alt"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        dialogController.result.value = await Get.dialog(
                            DialogWrapper(
                              child: DialogLoginAlt(
                                filled: true,
                              ),
                            ),
                            useSafeArea: true);
                      },
                      child: const Text("Dialog AltFilled"),
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
                        dialogController.result.value = await Get.dialog(DialogWrapper(child: DialogLogin()), useSafeArea: true);
                      },
                      child: const Text("Dialog Login"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        dialogController.result.value = await Get.to(() => LoginScreen());
                      },
                      child: const Text("Screen Login"),
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
                        dialogController.result.value = await Get.to(() => Feed());
                      },
                      child: const Text("Feed Check"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        dialogController.result.value = await Get.to(() => BottomNav());
                      },
                      child: const Text("Bottom Navigation"),
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
                        currentThemeModeLight = !currentThemeModeLight;
                        Get.changeThemeMode(currentThemeModeLight ? ThemeMode.light : ThemeMode.dark);
                      },
                      child: const Text("Switch Theme"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        Get.to(() => Settings());
                      },
                      child: const Text("Settings"),
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
                        Get.to(() => ProfileScreen());
                      },
                      child: const Text("Profile"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        Get.to(() => Checklist());
                      },
                      child: const Text("Checklist"),
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
                        Get.to(() => TextEditorScreen());
                      },
                      child: const Text("Editor"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () async {
                        dialogController.result.value = await Get.to(() => ImageGallery());
                      },
                      child: const Text("Image Gallery"),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
