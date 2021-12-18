import 'dart:collection';

import 'package:projectx/database/models/server/post.dart';

import 'category.dart';

class Categories extends ListBase<Category> {
  List<Category> innerList;

  Categories(this.innerList);

  factory Categories.fromJson(List<dynamic> json) => Categories(json.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList());

  @override
  set length(int newLength) {}

  @override
  int get length => innerList.length;

  @override
  void operator []=(int index, Category value) => innerList[index] = value;

  @override
  Category operator [](int index) => innerList[index];
}
