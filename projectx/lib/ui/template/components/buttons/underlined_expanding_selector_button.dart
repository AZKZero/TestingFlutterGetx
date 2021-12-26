import 'package:flutter/material.dart';
import 'package:projectx/ui/styles/alt_colors.dart';

class UnderlinedExpandingSelectorButton extends StatelessWidget {
  const UnderlinedExpandingSelectorButton({Key? key, required this.isSelected, required this.onPressed, required this.selectionColor, required this.text, required this.icon}) : super(key: key);

  final bool isSelected;
  final VoidCallback onPressed;
  final Color Function(bool) selectionColor;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: isSelected ? Border(bottom: BorderSide(width: 3, color: selectionColor(true))) : null),
      child: TextButton(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selectionColor(isSelected),
            ),
            Text(isSelected ? text : "", style: TextStyle(color: AltColors.textHighlightX, fontSize: 13)),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
