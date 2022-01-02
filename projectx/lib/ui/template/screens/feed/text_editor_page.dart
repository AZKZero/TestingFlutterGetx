import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';
import 'package:projectx/ui/styles/alt_colors.dart';

class TextEditorPage extends StatelessWidget {
  TextEditorPage({Key? key, this.oldData}) : super(key: key) {
    try {
      _quillController = quill.QuillController(
        document: quill.Document.fromJson(jsonDecode(oldData ?? "")),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } catch (e) {
      print(e);
      _quillController = quill.QuillController(
        document: quill.Document()..insert(0, oldData ?? ""),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
  }

  late final quill.QuillController _quillController;
  final FocusNode _focusNode = FocusNode();

  String? oldData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * (MediaQuery.of(context).viewInsets.bottom == 0 ? 0.8 : 0.55),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          minWidth: 10,
          minHeight: 10,
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        child: Stack(
          children: [
            Positioned.fill(
              top: 5,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            child: const Text(
                              "Edit/Create Post",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Icon(Icons.close),
                          // label: const Text(""),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.red,
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.all(10),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)))),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                    Row(
                      children: [
                        /*Expanded(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  primary: Colors.white,
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.all(10),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder()),
                              onPressed: () => Get.back(),
                              child: const Text("Close")),
                        ),*/
                        Expanded(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AltColors.appbarX,
                                  // backgroundColor: Colors.green,
                                  primary: Colors.white,
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.all(10),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder()),
                              onPressed: () {
                                log(jsonEncode(_quillController.document.toDelta().toJson()), name: "Alt-X");
                                log(jsonEncode(_quillController.document.toPlainText()), name: "Alt-X");

                                Get.back(result: jsonEncode(_quillController.document.toDelta().toJson()));
                              },
                              child: const Text("Save")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(top: 0, right: 0, child: TextButton.icon(label: Text(""), onPressed: () => Get.back(), icon: const Icon(Icons.close))),
          ],
        ));
  }
}
