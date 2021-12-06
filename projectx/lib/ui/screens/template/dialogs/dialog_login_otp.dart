import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

class DialogLoginOTP extends StatelessWidget {
  DialogLoginOTP({Key? key}) : super(key: key) {
    tosX.addListener(() {
      allowSubmit.value = tosX.text.length == 7;
    });
  }

  Rxn<String> stringX = Rxn(null);
  var allowSubmit = false.obs;

  TextEditingController tosX = TextEditingController();

  final FocusNode _pinPutNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return const BoxDecoration(
      border: Border(bottom: BorderSide()),
      // borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /*LayoutBuilder(
                    builder: (context, constraints) => PinCodeTextField(
                      maxLength: 7,
                      hasUnderline: true,
                      hasError: !allowSubmit,
                      // onDone: (pin) => Get.back(result: pin),
                      onTextChanged: (value) => allowSubmit = value.length == 7,
                      hasTextBorderColor: Colors.green,
                      pinBoxBorderWidth: 0,
                      pinBoxDecoration: null,
                      pinBoxOuterPadding: const EdgeInsets.all(5.0),
                      pinBoxWidth: MediaQuery.of(context).size.width / 14,
                      isCupertino: true,
                    ),
                  ),*/

                      PinPut(
                        // inputDecoration: InputDecoration(icon: IconButton(onPressed: () => tosX.text = "", icon: const Icon(Icons.cancel))),
                        fieldsCount: 7,
                        // initialValue: stringX.value,
                        autofocus: true,
                        focusNode: _pinPutNode,
                        withCursor: true,
                        // onSubmit: (pin) => Get.back(result: pin),
                        /* onChanged: (value) {
                          stringX.value = value;
                          allowSubmit.value = value.length == 7;
                        },*/
                        controller: tosX,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                          // borderRadius: BorderRadius.circular(20.0),
                          border: Border(bottom: BorderSide(color: allowSubmit.value ? Colors.green : Colors.red)),
                          // border: Border.all(color: allowSubmit.value ? Colors.green : Colors.red),
                        ),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                          // borderRadius: BorderRadius.circular(5.0),
                          border: Border(bottom: BorderSide(color: allowSubmit.value ? Colors.green : Colors.red)),
                          /* border: Border.all(
                        color: Colors.deepPurpleAccent.withOpacity(.5),
                      ),*/
                        ),
                      ),

                      /*OTPTextField(
                    length: 7,
                    // width: MediaQuery.of(context).size.width,
                    // fieldWidth: MediaQuery.of(context).size.width/7,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) => Get.back(result: pin),
                    onChanged: (value) => allowSubmit = value.length == 7,
                  ),*/
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => tosX.text = "",
                            child: const Text("Clear"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: allowSubmit.value ? () => Get.back(result: {"result": tosX.text}) : null,
                            child: const Text("Close"),
                          ),
                        ),
                      ])
                    ],
                  )),
            ),
          )),
    );
  }
}
