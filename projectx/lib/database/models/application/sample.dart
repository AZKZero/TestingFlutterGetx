import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sample.g.dart';

@JsonSerializable()
class SampleX {

	 final int? userId;
	 final int? id;
	 final String? title;
	 final bool? completed;
  
  SampleX({this.id, this.title, this.completed, this.userId});

  factory SampleX.fromJson(Map<String, dynamic> json) => _$SampleXFromJson(json);

  Map<String, dynamic> toJson() => _$SampleXToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}