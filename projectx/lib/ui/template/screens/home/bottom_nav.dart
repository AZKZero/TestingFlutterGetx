import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/main.dart';
import 'package:projectx/ui/misc/interfaces/titled_page.dart';
import 'package:projectx/ui/styles/alt_colors.dart';
import 'package:projectx/ui/template/dialogs/dialog_wrapper.dart';
import 'package:projectx/ui/template/screens/checklist/checklist_page.dart';
import 'package:projectx/ui/template/screens/feed/feed_page.dart';
import 'package:projectx/ui/template/screens/feed/text_editor_page.dart';
import 'package:projectx/ui/template/screens/profile/profile_page.dart';
import 'package:projectx/ui/template/screens/settings/settings_page.dart';

import 'buttons/underlined_expanding_selector_button.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key) {
    _feedController.loadFeed();
    _children = [
      FeedPage(
        key: const PageStorageKey(0),
        onEdit: onEditorRequest,
      ),
      ChecklistPage(key: const PageStorageKey(1)),
      ProfilePage(key: const PageStorageKey(2)),
      SettingsPage(key: const PageStorageKey(3))
    ];
  }

  final FeedController _feedController = Get.find();

  var currentIndex = 0.obs;

  final _bucket = PageStorageBucket();

  late final _children;

  // get selectedItemColor => AltColors.appbarX2;
  //
  // get unselectedItemColor => Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var selectedItemColor = AltColors.appbarX2;

      var unselectedItemColor = AltColors.unselectedX;
      return Scaffold(
        backgroundColor: currentThemeModeLight.value ? Colors.grey.shade50 : ColorsDark.greyBlack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsLight.appbar,
          // foregroundColor: Colors.transparent,

          // flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(value: const SystemUiOverlayStyle().copyWith(statusBarColor: ColorsLight.appbar), child: Container()),
          actions: [if (currentIndex.value == 0) IconButton(onPressed: () => _feedController.showSearch.toggle(), icon: const Icon(Icons.search))],
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: Center(
            child: Text((_children[currentIndex.value] as TitledPage).title),
          ),
        ),
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
            ? null
            : FloatingActionButton(
                backgroundColor: AltColors.appbarX,
                foregroundColor: Colors.white,
                elevation: 0,
                // shape: const CircleBorder(side: BorderSide(color: ColorsLight.appbar, width: 5)),
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
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: AltColors.appbarX1,
          elevation: 8,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: UnderlinedExpandingSelectorButtonWithAsset(
                    text: "Feed",
                    asset: "assets/images/icons/home.png",
                    onPressed: () => currentIndex.value = 0,
                    isSelected: currentIndex.value == 0,
                    selectionColor: (selected) => selected ? selectedItemColor : unselectedItemColor,
                  )),
              Expanded(
                flex: 2,
                child: UnderlinedExpandingSelectorButtonWithAsset(
                  text: "Checklist",
                  asset: "assets/images/icons/notification.png",
                  onPressed: () => currentIndex.value = 1,
                  isSelected: currentIndex.value == 1,
                  selectionColor: (selected) => selected ? selectedItemColor : unselectedItemColor,
                ),
              ),
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 2,
                child: UnderlinedExpandingSelectorButtonWithAsset(
                  text: "Profile",
                  asset: "assets/images/icons/user.png",
                  onPressed: () => currentIndex.value = 2,
                  isSelected: currentIndex.value == 2,
                  selectionColor: (selected) => selected ? selectedItemColor : unselectedItemColor,
                ),
              ),
              Expanded(
                flex: 2,
                child: UnderlinedExpandingSelectorButtonWithAsset(
                  text: "Settings",
                  asset: "assets/images/icons/settings.png",
                  onPressed: () => currentIndex.value = 3,
                  isSelected: currentIndex.value == 3,
                  selectionColor: (selected) => selected ? selectedItemColor : unselectedItemColor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: PageStorage(bucket: _bucket, child: _children[currentIndex.value]),
        ),
      );
    });
  }

  onEditorRequest(PostInternal post) async {
    // log( ?? "Null");
    var result = await Get.dialog(
        DialogWrapper(
            child: TextEditorPage(
          oldData: post.description,
        )),
        useSafeArea: true);

    var newPost = post.copyWith(description: result);
    _feedController.dbController.postDao?.savePost(newPost);
  }
}

/*BottomNavigationBar(
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
                BottomNavigationBarItem(icon: Icon(null), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), activeIcon: Icon(Icons.account_circle_outlined), label: "PROFILE"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings), label: "SETTINGS"),
              ])*/

/*IndexedStack(
              children: _children,
              index: currentIndex.value,
            )*/
