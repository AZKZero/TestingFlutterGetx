import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/factories/dialog_controller.dart';
import 'package:projectx/main.dart';
import 'package:projectx/ui/template/dialogs/dialog1.dart';
import 'package:projectx/ui/template/dialogs/dialog_login.dart';
import 'package:projectx/ui/template/dialogs/dialog_login_alt.dart';
import 'package:projectx/ui/template/dialogs/dialog_login_otp.dart';
import 'package:projectx/ui/template/dialogs/dialog_wrapper.dart';
import 'package:projectx/ui/template/screens/checklist/checklist.dart';
import 'package:projectx/ui/template/screens/feed/feed.dart';
import 'package:projectx/ui/template/screens/feed/text_editor_screen.dart';
import 'package:projectx/ui/template/screens/image_gallery.dart';
import 'package:projectx/ui/template/screens/profile/profile_screen.dart';
import 'package:projectx/ui/template/screens/settings/settings.dart';

class UITestingGrounds extends StatelessWidget {
  UITestingGrounds({Key? key}) : super(key: key);

  DialogController dialogController = Get.find();

  bool onIosBackground(ServiceInstance service) {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('FLUTTER BACKGROUND FETCH');

    return true;
  }

  void onStart(ServiceInstance service) {
    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    // bring to foreground
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        service.setForegroundNotificationInfo(
          title: "My App Service",
          content: "Updated at ${DateTime.now()}",
        );
      }

      /// you can see this log in logcat
      print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

      // test using external plugin
      final deviceInfo = DeviceInfoPlugin();
      String? device;
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.model;
      }

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        device = iosInfo.model;
      }

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
          "device": device,
        },
      );
    });
  }

  final FlutterBackgroundService service = FlutterBackgroundService();

  Future<void> initializeService() async {
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: false,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: false,

        // this will executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: onIosBackground,
      ),
    );
    service.startService();
  }

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
                        // dialogController.result.value = await Get.to(() => LoginScreen());
                        dialogController.result.value = await Get.toNamed('/login') as Object;
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
                        dialogController.result.value = await Get.offAndToNamed('/home');
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
                      onPressed: () async => changeThemeMode(),
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
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<bool>(
                    future: service.isRunning(),
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          Expanded(
                              child: OutlinedButton(
                            onPressed: snapshot.hasData && (snapshot.data ?? false) ? null : () => initializeService(),
                            child: Text(snapshot.hasData && (snapshot.data ?? false) ? "Service Running" : "Start Service"),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: OutlinedButton(
                            onPressed: snapshot.hasData && (snapshot.data ?? false) ? () => service.invoke('stopService') : null,
                            child: Text(snapshot.hasData && (snapshot.data ?? false) ? "Stop Service" : "Service Not Running"),
                          )),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
