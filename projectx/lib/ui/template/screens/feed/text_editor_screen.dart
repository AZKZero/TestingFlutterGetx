import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:projectx/ui/styles/alt_colors.dart';

class TextEditorScreen extends StatelessWidget {
  TextEditorScreen({Key? key}) : super(key: key);

  final quill.QuillController _quillController = quill.QuillController.basic();
  final FocusNode _focusNode = FocusNode();

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
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                    child: Container(
                        height: MediaQuery.of(context).size.height * (MediaQuery.of(context).viewInsets.bottom == 0 ? 0.8 : 0.55),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                          minWidth: 10,
                          minHeight: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                                      // child: quill.QuillEditor.basic(controller: _quillController, readOnly: false),
                                      child: quill.QuillEditor(
                                        controller: _quillController,
                                        focusNode: _focusNode,
                                        autoFocus: true,
                                        padding: EdgeInsets.zero,
                                        expands: false,
                                        scrollable: true,
                                        readOnly: false,
                                        scrollController: ScrollController(),
                                      )),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: ColorsLight.appbar),
                                onPressed: () {
                                  log(jsonEncode(_quillController.document.toDelta().toJson()), name: "Alt-X");
                                  log(jsonEncode(_quillController.document.toPlainText()), name: "Alt-X");
                                },
                                child: const Text("print")),
                            // if (MediaQuery.of(context).viewInsets.bottom != 0)
                            Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: quill.QuillToolbar.basic(
                                      controller: _quillController,
                                      showAlignmentButtons: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
