import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/factories/dialog_controller.dart';
import 'package:projectx/ui/screens/template/dialogs/dialog1.dart';

class UITestingGrounds extends StatelessWidget {
  UITestingGrounds({Key? key}) : super(key: key);

  DialogController dialogController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UI Testing Grounds"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Text((dialogController.result.value as String?) ?? "")),
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () async {
                      dialogController.result.value = await Get.dialog(
                         Dialog1(),
                          useSafeArea: true);
                    },
                    child: const Text("Dialog"),
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
