import 'package:flutter/material.dart';
import 'package:projectx/tile_button.dart';

class ListBase extends StatelessWidget {
  const ListBase({Key? key, required this.base, required this.background}) : super(key: key);

  final String base;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 10, itemBuilder: (context, index) => TileButton(buttonTitle: "$base+${index + 1}", buttonBack: background));
  }
}
