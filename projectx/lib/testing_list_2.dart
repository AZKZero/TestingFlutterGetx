import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/list_base.dart';

class TestingListWithoutMixin extends StatelessWidget {
  TestingListWithoutMixin({Key? key}) : super(key: key);

  SelectionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing list = ${controller.currentText.value}"),
        backgroundColor: controller.currentColor.value,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(child: Obx(() => ListBase(base: controller.currentText.value, background: controller.currentColor.value))),
            Expanded(
                child: TextButton(
              onPressed: () {
                controller.currentText.value += " addition";
              },
              child: const Text("stateless controller"),
            ))
          ],
        ),
      ),
    );
  }
}
