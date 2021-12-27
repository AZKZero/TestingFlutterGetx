import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/models/server/category.dart';
import 'package:projectx/database/models/server/post.dart';

import '../database/models/server/user.dart';

class FeedController extends GetxController {
  final DBController dbController = Get.find();

  var showSearch=false.obs;

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
  }

  Stream<List<PostInternal>>? getFeed(String searchUnused) {
    return dbController.postDao?.getPosts().watch();
  }

  checkAndSeedFeed() async {
    if (dbController.database == null) {
      await dbController.initializeDB();
    }
    int postCount = await dbController.postDao?.getPostCount().getSingle() ?? 0;
    if (postCount == 0) {
      var postList = (json.decode(await rootBundle.loadString("assets/jsons/posts/posts.json")) as List<dynamic>).map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
      await dbController.postDao?.savePosts(postList);
    }
  }
}
