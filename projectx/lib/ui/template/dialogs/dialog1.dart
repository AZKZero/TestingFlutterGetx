import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialog1 extends StatelessWidget {
  Dialog1({Key? key}) : super(key: key);

  TextEditingController tosX = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: Card(
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
                  ElevatedButton(
                    onPressed: () => Get.back(result: {"result": tosX.text}),
                    child: const Text("Close"),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
