import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as json_x;
import 'package:projectx/database/drift_database.dart';

part 'blog.g.dart';

@json_x.JsonSerializable()
class Blog implements Insertable<NewBlog> {
  @json_x.JsonKey(name: "id", defaultValue: 0)
  int? id = 0;

  String? title;

  String? description;

  @json_x.JsonKey(name: "cover_photo")
  String? coverPhoto;

  @json_x.JsonKey(name: "author")
  @AuthorConverter()
  Author? author;

  List<String>? categories;

  Blog({this.id = 0, this.title, this.description, this.coverPhoto, this.author, this.categories});

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return BlogsCompanion(title: Value(title), description: Value(description), categories: Value(categories), coverPhoto: Value(coverPhoto), authorId: Value(author?.id)).toColumns(nullToAbsent);
  }
}
