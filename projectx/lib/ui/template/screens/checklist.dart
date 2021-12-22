import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/ui/misc/alt_colors.dart';

class Checklist extends StatelessWidget {
  Checklist({Key? key}) : super(key: key) {
    _feedController.loadFeed();
  }

  /*{
    x = (_formController.currentState?.value ?? {}).obs;
  }*/

  final FeedController _feedController = Get.find();
  final _formController = GlobalKey<FormBuilderState>();

  // RxMap x={}.obs;

  @override
  Widget build(BuildContext context) {
    // _formController.currentState?.sa
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
          title: const Text("Checklist"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  child: SingleChildScrollView(
                                    child: FormBuilder(
                                        key: _formController,
                                        child: Obx(() => Column(
                                              children: [
                                                ..._feedController.users
                                                    .map((user) => FormBuilderCheckbox(
                                                          name: user.username ?? "x",
                                                          title: Text(user.username ?? "x"),
                                                          initialValue: null,
                                                          tristate: true,
                                                        ))
                                                    .toList()
                                              ],
                                            ))),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _formController.currentState?.save();
                                      log("formMap: ${_formController.currentState?.value}");
                                      // _formController.currentState?.fields["ch2"]?.didChange(null);
                                    },
                                    child: const Text("print map"))
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
        ));
  }
}
