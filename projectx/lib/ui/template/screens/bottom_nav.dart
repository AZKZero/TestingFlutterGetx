import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/ui/misc/alt_colors.dart';
import 'package:projectx/ui/template/dialogs/dialog_wrapper.dart';
import 'package:projectx/ui/template/pages/checklist_page.dart';
import 'package:projectx/ui/template/pages/feed_page.dart';
import 'package:projectx/ui/template/pages/profile_page.dart';
import 'package:projectx/ui/template/pages/settings_page.dart';
import 'package:projectx/ui/template/pages/text_editor_page.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key) {
    _feedController.loadFeed();
  }
  final FeedController _feedController = Get.find();

  var currentIndex = 0.obs;

  final _bucket = PageStorageBucket();

  final _children = [
    FeedPage(
      key: const PageStorageKey(0),
    ),
    ChecklistPage(key: const PageStorageKey(1)),
    ProfilePage(key: const PageStorageKey(2)),
    SettingsPage(key: const PageStorageKey(3))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: ColorsLight.appbar,
              elevation: 0,
              shape: const CircleBorder(side: BorderSide(color: ColorsLight.appbar, width: 5)),
              onPressed: () async {
                Get.showSnackbar(GetSnackBar(
                  title: "Response",
                  message: await Get.dialog(DialogWrapper(child: TextEditorPage()), useSafeArea: true) ?? "Null",
                  duration: const Duration(seconds: 1),
                ));
                // log();
              },
              child: const Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: ColorsLight.appbar,
              selectedFontSize: 12,
              elevation: 8,
              unselectedFontSize: 12,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade300,
              currentIndex: currentIndex.value,
              onTap: (value) => currentIndex.value = value,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), activeIcon: Icon(Icons.home), label: "FEED"),
                BottomNavigationBarItem(icon: Icon(Icons.check_circle), activeIcon: Icon(Icons.check_circle), label: "CHECKLIST"),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), activeIcon: Icon(Icons.account_circle_outlined), label: "PROFILE"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings), label: "SETTINGS"),
              ])),
      body: SafeArea(
        child: Obx(() => PageStorage(bucket: _bucket, child: _children[currentIndex.value])),
      ),
    );
  }
}

/*IndexedStack(
              children: _children,
              index: currentIndex.value,
            )*/
