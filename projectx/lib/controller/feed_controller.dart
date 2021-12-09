import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectx/database/models/server/categories.dart';
import 'package:projectx/database/models/server/category.dart';
import 'package:projectx/database/models/server/post.dart';
import 'package:projectx/database/models/server/post_list.dart';

class FeedController extends GetxController {
  // ignore: unnecessary_cast
  RxList<Post> feed = (PostList(List.empty()) as List<Post>).obs;
  // ignore: unnecessary_cast
  RxList<Category> categories = (Categories(List.empty()) as List<Category>).obs;

  void loadFeed() async {
    feed.value = PostList.fromJson(json.decode(await rootBundle.loadString("assets/jsons/posts/posts.json")));
    categories.value = Categories.fromJson(json.decode(await rootBundle.loadString("assets/jsons/categories/categories.json")));
  }
}
