import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/ui/misc/alt_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key) {
    username.addListener(() {
      userNameGiven.value = username.text.isNotEmpty;
    });

    password.addListener(() {
      passwordGiven.value = password.text.isNotEmpty;
    });
  }

  var userNameGiven = false.obs;
  var passwordGiven = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [ColorsLight.linearGradientStart, ColorsLight.linearGradientEnd])),
          child: Stack(children: [
            Positioned(
              child: Image.asset(
                "assets/images/layers/wave_image.png",
                height: MediaQuery.of(context).size.height * 0.65,
                fit: BoxFit.fill,
              ),
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.75),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          TextFormField(
                            // autofocus: true,
                            controller: username,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0x44AAAAAA))), prefixIcon: Icon(Icons.account_circle_outlined), counterText: null),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: password,
                            autofocus: true,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0x44AAAAAA))),
                              // enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFFAAAAAA))),
                              prefixIcon: Icon(Icons.password_outlined),
                              counterText: null,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Obx(() => ElevatedButton(
                                      onPressed: userNameGiven.value && passwordGiven.value ? () => Get.back(result: {"username": username.text, "password": password.text}) : null,
                                      child: const Text("Close"),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ]),
        ));
  }
}
