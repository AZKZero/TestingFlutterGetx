import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:projectx/database/drift_database.dart';

class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.post, required this.onPressed, this.highlight = false}) : super(key: key) {
    var json;
    try {
      json = jsonDecode(post.description ?? "");
      _controller = quill.QuillController(
        document: quill.Document.fromJson(json),
        selection: const TextSelection.collapsed(offset: 0),
      );
      couldParseQuill = true;
    } catch (e) {
      // print(e);
      /* _controller = quill.QuillController(
        document: quill.Document()..insert(0, post.description ?? ""),
        selection: const TextSelection.collapsed(offset: 0),
      );*/
      couldParseQuill = false;
    }
  }

  PostInternal post;

  VoidCallback onPressed;

  bool highlight;

  late final quill.QuillController _controller;

  bool couldParseQuill = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, spreadRadius: 0.0, offset: const Offset(0, 4))],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(7.0)),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Image.network(
                          post.avatar ?? "",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                        child: Image.asset("assets/images/icons/time.png"),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8.0),
                          height: 46,
                          child: Text(
                            post.username ?? "",
                            style: TextStyle(color: highlight ? Colors.green : null),
                          )),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/icons/Share.png"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: couldParseQuill
                            ? quill.QuillEditor(
                                controller: _controller,
                                focusNode: FocusNode(canRequestFocus: false, descendantsAreFocusable: false),
                                autoFocus: false,
                                padding: EdgeInsets.zero,
                                expands: false,
                                showCursor: false,
                                scrollable: false,
                                readOnly: true,
                                scrollController: ScrollController(),
                              )
                            : Text(post.description ?? ""),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icons/Heart.png",
                                fit: BoxFit.contain,
                                // width: MediaQuery.of(context).size.height * 0.05,
                                // height: MediaQuery.of(context).size.height * 0.05,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                post.likes?.toString() ?? "",
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icons/speech-bubble.png",
                                fit: BoxFit.contain,
                                // width: MediaQuery.of(context).size.height * 0.05,
                                // height: MediaQuery.of(context).size.height * 0.05,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                post.comments?.toString() ?? "",
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          )),
                      // TextButton.icon(onPressed: () {}, icon: const Icon(Icons.comment), label: Text(post.comments?.toString() ?? "")),
                      // TextButton.icon(onPressed: () {}, icon: const Icon(Icons.favorite), label: Text(post.likes?.toString() ?? "")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*

                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.fromLTRB(8.0,8.0,0,8.0),
                      child: Image.network(
                        post.avatar ?? "",
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.fromLTRB(0,0,0,8.0),
                      child: const Icon(
                        Icons.info,
                        size: 10.0,
                      ),
                    ),
                    Column(
                      children: [
                        Flexible(
                          child: Container(alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(8.0),
                              height: 30,
                              child: Text(post.username ?? "")),
                        ),
                      ],
                    )
                  ],
                ),
 */
