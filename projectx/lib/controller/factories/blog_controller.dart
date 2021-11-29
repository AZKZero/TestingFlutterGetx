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
      if (result.value == null && DateTime.now().millisecondsSinceEpoch - currentTime > 5000) {
        requestInFlight.value = true;
        currentTime = DateTime.now().millisecondsSinceEpoch;
        HttpResponse<BlogResponse> response = await controller.client.getBlogs();
        requestResult.value = response.response.statusCode == 200;
        result.value = response.data;

        response.data.blogs?.forEach((element) {
          controllerDB.blogDao.insertBlog(element.getBlog());
        });

        requestInFlight.value = false;
      }

      // return result.value;
    } catch (e) {
      requestResult.value = false;
      // return null;
    }
  }
}
