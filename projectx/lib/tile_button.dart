import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/testing_list.dart';
import 'package:projectx/testing_list_2.dart';

class TileButton extends StatelessWidget {
  const TileButton({Key? key, required this.buttonTitle, required this.buttonBack, this.controller}) : super(key: key);

  final String buttonTitle;
  final Color buttonBack;
  final SelectionController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: TextButton.icon(
          icon: const Icon(Icons.ac_unit_rounded),
          onLongPress: () {
            controller?.currentText.value = buttonTitle;
            controller?.currentColor.value = buttonBack;
            Get.to(TestingListWithoutMixin());
          },
          onPressed: () {
            controller?.currentText.value = buttonTitle;
            controller?.currentColor.value = buttonBack;
          },
          label: Text(buttonTitle),
          style: TextButton.styleFrom(primary: Colors.white, backgroundColor: buttonBack, padding: const EdgeInsets.all(20)),
        ),
      ),
    );
  }
}
