import 'package:json_annotation/json_annotation.dart';
import 'package:projectx/database/models/application/author.dart';
import 'package:projectx/database/models/application/blog.dart';

part 'blog_response.g.dart';

@JsonSerializable()
class BlogResponse {
  List<RemoteBlog>? blogs;

  BlogResponse();

  factory BlogResponse.fromJson(Map<String, dynamic> json) => _$BlogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);
}

@JsonSerializable()
class RemoteBlog {
  RemoteBlog();

  int? id;

  String? title;

  String? description;

  @JsonKey(name: "cover_photo")
  String? coverPhoto;

  Author? author;

  List<String>? categories;

  factory RemoteBlog.fromJson(Map<String, dynamic> json) => _$RemoteBlogFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteBlogToJson(this);

  Blog getBlog() {
    return Blog(id: id, title: title, description: description, coverPhoto: coverPhoto, authorId: author?.id);
  }
}
