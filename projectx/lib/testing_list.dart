import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/list_base.dart';

class TestingList extends StatelessWidget {
  const TestingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MixinBuilder<SelectionController>(
      init: SelectionController(),
      builder: (controller) =>
          Scaffold(
            appBar: AppBar(
              title: Text("Testing list = ${controller.currentText.value}"),
              backgroundColor: controller.currentColor,
            ),
            body: ListBase(base: controller.currentText.value, background: controller.currentColor),
          ),
    );
  }
}
