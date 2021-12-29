import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:projectx/main.dart';
import 'package:projectx/ui/misc/interfaces/titled_page.dart';
import 'package:projectx/ui/styles/alt_colors.dart';
import 'package:projectx/ui/template/screens/testing_ground.dart';

class SettingsPage extends StatelessWidget implements TitledPage {
  @override
  String get title => "Settings";

  SettingsPage({Key? key}) : super(key: key);

  var switchState1 = false.obs;
  var switchState2 = false.obs;
  var switchState3 = false.obs;
  var switchState4 = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(8),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, spreadRadius: 0.0, offset: const Offset(0, 4))],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(7.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  alignment: Alignment.center,
                                  color: ColorsLight.appbar,
                                  child: const Text(
                                    "Header",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  )))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16.0,
                          0,
                          16.0,
                          16.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(child: Text("Item 1")),
                                Switch(
                                  value: switchState1.value,
                                  onChanged: (value) => switchState1.value = value,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(child: Text("Item 2")),
                                Switch(
                                  value: switchState2.value,
                                  onChanged: (value) => switchState2.value = value,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(child: Text("Item 3")),
                                Switch(
                                  value: switchState3.value,
                                  onChanged: (value) => switchState3.value = value,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(child: Text("Item 4")),
                                Switch(
                                  value: switchState4.value,
                                  onChanged: (value) => switchState4.value = value,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () async => changeThemeMode(),
                    child: const Text("Switch Theme"),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => Get.to(UITestingGrounds()),
                    child: const Text("UI Testing Grounds"),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
