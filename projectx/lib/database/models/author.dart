import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
@Entity(tableName: "authors")
class Author {
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

  Author({this.id, this.name, this.avatar, this.profession});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
