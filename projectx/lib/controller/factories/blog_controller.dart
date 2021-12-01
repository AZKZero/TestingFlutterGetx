import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/controller/network_controller.dart';
import 'package:projectx/database/models/server/blog_response.dart';
import 'package:retrofit/dio.dart';

class BlogController extends GetxController {
  DBController controllerDB = Get.find();
  NetworkController controller = Get.find();

  Rxn<BlogResponse> result = Rxn(null);
  RxBool requestResult = false.obs;
  RxBool requestInFlight = false.obs;

  int currentTime = 0;

  Future<void> getBlogs() async {
    try {
      var blogCount = await controllerDB.blogDao.getBlogsCount();
      var allblogs = await controllerDB.blogDao.getBlogs();
      log("$blogCount $currentTime");

      // allblogs?.forEach((element) => log("Found Blog $element"));

      if (result.value == null && DateTime.now().millisecondsSinceEpoch - currentTime > 5000 && blogCount == 0) {
        requestInFlight.value = true;
        currentTime = DateTime.now().millisecondsSinceEpoch;
        HttpResponse<BlogResponse> response = await controller.client.getBlogs();
        requestResult.value = response.response.statusCode == 200;
        result.value = response.data;
        log("${response.data}");

        if (response.data.blogs != null) {
          await controllerDB.blogDao.insertBlogAuthorV2(response.data.blogs!);
        }

        requestInFlight.value = false;
      }

      // return result.value;
    } catch (e, stacktrace) {
      requestResult.value = false;
      e.printError();
      stacktrace.printError();
      // return null;
    }
  }
}
