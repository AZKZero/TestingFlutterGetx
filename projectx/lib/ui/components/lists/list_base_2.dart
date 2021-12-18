import 'package:flutter/material.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/ui/components/tile_button.dart';
import 'package:projectx/utils/name_colors.dart';


class ListNew extends StatelessWidget {
  const ListNew({Key? key, required this.items}) : super(key: key);

  final List<Log> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String? text = items[index].buttonClicked;
          return TileButton(key: UniqueKey(), buttonTitle: "${items[index].dateButtonClickedOn}\n$text", buttonBack: getNamedColor(text));
        });
  }
}
