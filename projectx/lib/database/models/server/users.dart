import 'dart:collection';

import 'package:projectx/database/models/server/post.dart';
import 'package:projectx/database/models/server/user.dart';

import 'category.dart';

class Users extends ListBase<User> {
  List<User> innerList;

  Users(this.innerList);

  factory Users.fromJson(List<dynamic> json) => Users(json.map((e) => User.fromJson(e as Map<String, dynamic>)).toList());

  @override
  set length(int newLength) {}

  @override
  int get length => innerList.length;

  @override
  void operator []=(int index, User value) => innerList[index] = value;

  @override
  User operator [](int index) => innerList[index];
}
