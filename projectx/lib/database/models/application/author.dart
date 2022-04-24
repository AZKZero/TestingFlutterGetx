import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class AuthorOld {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "avatar")
  String? avatar;

  @JsonKey(name: "profession")
  String? profession;

  AuthorOld({this.id, this.name, this.avatar, this.profession});

  factory AuthorOld.fromJson(Map<String, dynamic> json) => _$AuthorOldFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorOldToJson(this);
}
