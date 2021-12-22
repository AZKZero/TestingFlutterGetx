import 'package:flutter/material.dart';
import 'package:projectx/ui/misc/alt_colors.dart';

class CardStyle1 extends StatelessWidget {
  const CardStyle1({Key? key, required this.headerText, required this.content}) : super(key: key);

  final String headerText;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, spreadRadius: 0.0, offset: const Offset(0, 4))],
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(7.0)),
          child: InkWell(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(12.0),
                            alignment: Alignment.center,
                            color: ColorsLight.appbar,
                            child: Text(
                              headerText,
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16.0,
                    0,
                    16.0,
                    16.0,
                  ),
                  child: content,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
