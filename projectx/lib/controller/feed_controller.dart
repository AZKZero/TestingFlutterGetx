import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectx/database/models/server/category.dart';
import 'package:projectx/database/models/server/post.dart';

import '../database/models/server/user.dart';

class FeedController extends GetxController {
  // ignore: unnecessary_cast
  RxList<Post> feed = List<Post>.empty().obs;

  // ignore: unnecessary_cast
  RxList<Category> categories = List<Category>.empty().obs;

  // ignore: unnecessary_cast
  RxList<User> users = List<User>.empty().obs;

  RxList<String> photos = List<String>.empty().obs;

  void loadFeed() async {
    feed.value = (json.decode(await rootBundle.loadString("assets/jsons/posts/posts.json")) as List<dynamic>).map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    categories.value = (json.decode(await rootBundle.loadString("assets/jsons/categories/categories.json")) as List<dynamic>).map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
    users.value = (json.decode(await rootBundle.loadString("assets/jsons/users/users.json")) as List<dynamic>).map((e) => User.fromJson(e as Map<String, dynamic>)).toList();

    photos.value = (json.decode(await rootBundle.loadString("assets/jsons/photos/photos.json")) as List<dynamic>).map((e) => e as String).toList();

    // feed.value = PostList.fromJson(json.decode(await rootBundle.loadString("assets/jsons/posts/posts.json")));
    // categories.value = Categories.fromJson(json.decode(await rootBundle.loadString("assets/jsons/categories/categories.json")));
    // users.value = Users.fromJson(json.decode(await rootBundle.loadString("assets/jsons/users/users.json")));
  }
}
