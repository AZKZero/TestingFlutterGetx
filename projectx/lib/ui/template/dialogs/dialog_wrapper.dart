import 'package:flutter/material.dart';

class DialogWrapper extends StatelessWidget {
  const DialogWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(margin: MediaQuery.of(context).viewInsets, child: child, duration: const Duration(milliseconds: 100));
  }
}
