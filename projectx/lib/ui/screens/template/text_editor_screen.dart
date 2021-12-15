import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../components/alt_colors.dart';

class TextEditorScreen extends StatelessWidget {
  TextEditorScreen({Key? key}) : super(key: key);

  final QuillController _quillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Container(
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
                    bottom: 10,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                          minWidth: 10,
                          minHeight: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                                  child: SingleChildScrollView(reverse: true, child: QuillEditor.basic(controller: _quillController, readOnly: false)),
                                ),
                              ),
                            ),
                            QuillToolbar.basic(controller: _quillController),
                          ],
                        )),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
