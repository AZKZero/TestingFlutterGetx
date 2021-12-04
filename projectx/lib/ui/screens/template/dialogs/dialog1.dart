import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialog1 extends StatelessWidget {
  Dialog1({Key? key}) : super(key: key);

  TextEditingController tosX = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(height: 200, width: 300, constraints: const BoxConstraints(maxWidth: 400, minWidth: 10, minHeight: 10, maxHeight: 300), child: Card(
        shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tosX,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(tosX.text),
              ElevatedButton(
                onPressed: () => Get.back(result: tosX.text),
                child: const Text("Close"),
              )
            ],
          ),
        ),
      )),
    );
  }
}
