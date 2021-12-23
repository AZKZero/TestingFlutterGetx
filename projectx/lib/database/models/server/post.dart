import 'package:drift/drift.dart';
import 'package:projectx/database/drift_database.dart';

class Post implements Insertable<PostInternal> {
  String? username;
  String? description;
  String? avatar;
  int? likes;
  bool? isLiked;
  int? comments;

  Post({this.username, this.avatar, this.likes, this.isLiked, this.comments, this.description});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        username: json['username'],
        avatar: json['avatar'],
        likes: json['likes'],
        isLiked: json['is_liked'],
        comments: json['comments'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['avatar'] = avatar;
    data['likes'] = likes;
    data['is_liked'] = isLiked;
    data['comments'] = comments;
    data['description'] = description;
    return data;
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PostTableCompanion(
      id: const Value(null),
      username: Value(username),
      description: Value(description),
      avatar: Value(avatar),
      likes: Value(likes),
      isLiked: Value(isLiked),
      comments: Value(comments),
    ).toColumns(nullToAbsent);
  }
}
