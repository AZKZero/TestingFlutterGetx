import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/controller/factories/blog_controller.dart';
import 'package:projectx/controller/factories/dialog_controller.dart';
import 'package:projectx/controller/factories/task_controller.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/controller/network_controller.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/controller/user_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DBController()..initializeDB());
    Get.lazyPut(() => SelectionController());
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => FeedController());
    Get.lazyPut(() => UserController()..loadUser());
    Get.create<TaskController>(() => TaskController());
    Get.create<BlogController>(() => BlogController());
    Get.create<DialogController>(() => DialogController());
  }
}
