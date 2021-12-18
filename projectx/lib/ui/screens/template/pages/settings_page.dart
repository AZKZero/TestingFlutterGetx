import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:projectx/ui/components/alt_colors.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  var switchState1 = false.obs;
  var switchState2 = false.obs;
  var switchState3 = false.obs;
  var switchState4 = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsLight.appbar,
          // foregroundColor: Colors.transparent,
          centerTitle: true,
          // flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(value: const SystemUiOverlayStyle().copyWith(statusBarColor: ColorsLight.appbar), child: Container()),
          // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Settings"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, spreadRadius: 0.0, offset: const Offset(0, 4))],
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(7.0)),
                      child: InkWell(
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
