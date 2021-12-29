import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/controller/form_controller.dart';
import 'package:projectx/ui/misc/interfaces/titled_page.dart';
import 'package:projectx/ui/styles/alt_colors.dart';

class ChecklistPage extends StatelessWidget implements TitledPage {
  @override
  String get title => "Checklist";

  ChecklistPage({Key? key}) : super(key: key) {
    _formController2.valueMap.listen((p0) {
      log("listened");
      checked.value = p0.keys.where((element) => p0[element] == true).toList();
    });
  }

  /*{
    x = (_formController.currentState?.value ?? {}).obs;
  }*/

  final FocusNode _textFocusNode = FocusNode();

  final FeedController _feedController = Get.find();
  final _formController = GlobalKey<FormBuilderState>();
  final FormController _formController2 = Get.find();

  final checkedState = <String?, bool?>{};

  final usernameSearch = "".obs;

  RxList checked = [].obs;

  @override
  Widget build(BuildContext context) {
    // _formController.currentState?.sa
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.05,
          ),
          color: AltColors.backgroundX,
          child: Obx(() => checked.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: checked.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide(color: AltColors.appbarX), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(checked[index]),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () => _formController2.valueMap[checked[index]] = false,
                                child: const Icon(Icons.close),
                                style: TextButton.styleFrom(
                                  primary: AltColors.appbarX,
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.all(0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                )),
                          ],
                        )),
                  ),
                )
              : const SizedBox(height: 0)),
        ),
        Expanded(
          child: Padding(
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
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            10.0,
                            10.0,
                            10.0,
                            10.0,
                          ),
                          child: SingleChildScrollView(
                            child: Obx(() => Column(
                                  children: [
                                    ..._feedController.users
                                        .where((p0) => usernameSearch.value.isEmpty || (p0.username?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false))
                                        .map(
                                            (user) => /*FormBuilderCheckbox(
                                              checkBoxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                              focusOnChange: false,
                                              activeColor: currentThemeModeLight.value ? ColorsLight.appbar : Colors.green,
                                              name: user.username ?? "x",
                                              title: Text(user.username ?? "x"),
                                              initialValue: checkedState[user.username],
                                              tristate: true,
                                              onChanged: (value) => checkedState[user.username] = value,
                                            ))*/
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      tristate: true,
                                                      value: _formController2.valueMap[user.username],
                                                      onChanged: (value) => user.username != null ? _formController2.valueMap[user.username!] = value : null,
                                                      shape: const CircleBorder(),
                                                      activeColor: AltColors.backgroundX,
                                                      checkColor: AltColors.appbarX,
                                                      side: MaterialStateBorderSide.resolveWith((states) => !states.contains(MaterialState.disabled) ? BorderSide(color: AltColors.appbarX) : null),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(user.username ?? "")
                                                  ],
                                                ))
                                        .toList()
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(() => _feedController.showSearch.value
            ? Container(
                padding: const EdgeInsets.all(8.0),
                // decoration: const BoxDecoration(color: ColorsLight.appbar),
                child: TextFormField(
                  focusNode: _textFocusNode,
                  onChanged: (value) {
                    usernameSearch.value = value;
                    /*filtered.value = _feedController.feed
                      .where((p0) =>
                          usernameSearch.value.isEmpty ||
                          (p0.username?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false) ||
                          (p0.description?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false))
                      .toList();*/
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.black, decorationColor: AltColors.appbarX),
                  decoration: InputDecoration(
                      focusColor: AltColors.appbarX,
                      border: UnderlineInputBorder(borderSide: BorderSide(color: AltColors.appbarX)),
                      icon: Icon(
                        Icons.search,
                        color: AltColors.appbarX,
                      ),
                      labelStyle: TextStyle(color: AltColors.textNormalX),
                      labelText: "Search"),
                ),
              )
            : const SizedBox(height: 0))
      ],
    );
  }
}
