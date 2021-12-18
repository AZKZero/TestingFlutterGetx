// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class NameColors {

}

Color getNamedColor(String? text) {
  if(text==null) return Colors.blue;
  else if (text=="QMS") return Colors.lime;
  else if (text=="Project") return Colors.orangeAccent;
  else if (text=="Form") return Colors.amber;
  else if (text=="Documents") return Colors.teal;
  else if (text=="Tickets") return Colors.red;
  else if (text=="Assets") return Colors.lime;
  else return Colors.blue;
}