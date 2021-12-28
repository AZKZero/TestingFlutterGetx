import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/controller/factories/blog_controller.dart';
import 'package:projectx/controller/factories/dialog_controller.dart';
import 'package:projectx/controller/factories/task_controller.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/controller/form_controller.dart';
import 'package:projectx/controller/network_controller.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/controller/user_controller.dart';

class AppBindings implements Bindings {
  @override
  /*Future<void>*/ void dependencies() /*async*/ {
    Get.lazyPut(() => DBController().initializeDB());
    // await Get.putAsync(() async => await UserController().loadUser());
    // await Get.putAsync(() async => await FeedController().checkAndSeedFeed());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => FeedController());
    Get.lazyPut(() => SelectionController());
    Get.lazyPut(() => NetworkController());
    Get.create<TaskController>(() => TaskController());
    Get.create<BlogController>(() => BlogController());
    Get.create<DialogController>(() => DialogController());
    Get.create<FormController>(() => FormController());
  }
}
