import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/ui/screens/testing_list_2.dart';

class TileButton extends StatelessWidget {
  const TileButton({Key? key, required this.buttonTitle, required this.buttonBack, this.controller, this.navigate = false, this.padding = 20, this.margin = 20}) : super(key: key);

  final String buttonTitle;
  final Color buttonBack;
  final SelectionController? controller;
  final bool navigate;
  final double padding;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(margin),
          child: TextButton.icon(
            icon: const Icon(Icons.ac_unit_rounded),
            onLongPress: () {
              controller?.currentText.value = buttonTitle;
              controller?.currentColor = buttonBack;
              Get.to(TestingListWithoutMixin());
            },
            onPressed: () {
              controller?.saveCurrentText(buttonTitle);
              controller?.currentColor = buttonBack;
              if (navigate) {
                Get.to(TestingListWithoutMixin());
              }
            },
            label: Text(buttonTitle),
            style: TextButton.styleFrom(primary: Colors.white, backgroundColor: buttonBack, padding: EdgeInsets.all(padding)),
          ),
        ),
      ),
    ]);
  }
}

class SimpleTileButton extends StatelessWidget {

  SimpleTileButton({Key? key, required this.buttonTitle, required this.buttonBack, this.onPressed, this.padding = 20, this.margin = 20}) : super(key: key);

  VoidCallback? onPressed;
  final String buttonTitle;
  final Color buttonBack;
  final double padding;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(margin),
          child: TextButton.icon(
            icon: const Icon(Icons.ac_unit_rounded),
            onPressed: onPressed,
            label: Text(buttonTitle),
            style: TextButton.styleFrom(primary: Colors.white, backgroundColor: buttonBack, padding: EdgeInsets.all(padding)),
          ),
        ),
      ),
    ]);
  }
}
