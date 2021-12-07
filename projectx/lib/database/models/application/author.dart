import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
@Entity(tableName: "authors")
class AuthorOld {
  @JsonKey(name: "id")
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "id")
  int? id;

  @JsonKey(name: "name")
  @ColumnInfo(name: "name")
  String? name;

  @JsonKey(name: "avatar")
  @ColumnInfo(name: "avatar")
  String? avatar;

  @JsonKey(name: "profession")
  @ColumnInfo(name: "profession")
  String? profession;

  AuthorOld({this.id, this.name, this.avatar, this.profession});

  factory AuthorOld.fromJson(Map<String, dynamic> json) => _$AuthorOldFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorOldToJson(this);
}
