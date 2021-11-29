import 'dart:convert';

import 'package:floor/floor.dart';

class ListConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? decode(String? databaseValue) => jsonDecode(databaseValue??"null") as List<String>?;

  @override
  String? encode(List<String>? value) => jsonEncode(value);
}
