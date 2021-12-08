import 'dart:collection';

import 'package:projectx/database/models/server/post.dart';

class PostList extends ListBase<Post> {
  List<Post> innerList;

  PostList(this.innerList);

  factory PostList.fromJson(List<dynamic> json) => PostList(json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList());

  @override
  set length(int newLength) {}

  @override
  int get length => innerList.length;

  @override
  void operator []=(int index, Post value) => innerList[index] = value;

  @override
  Post operator [](int index) => innerList[index];
}
