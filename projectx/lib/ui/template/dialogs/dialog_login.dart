import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogLogin extends StatelessWidget {
  DialogLogin({Key? key}) : super(key: key);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: username,
                    decoration: const InputDecoration(icon: Icon(Icons.account_circle_outlined), counterText: null),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password_outlined),
                      counterText: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.back(result: {"username": username.text, "password": password.text}),
                            child: const Text("Close"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
