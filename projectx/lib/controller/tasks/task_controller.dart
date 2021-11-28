import 'package:get/get.dart';
import 'package:projectx/controller/network_controller.dart';
import 'package:projectx/database/models/sample.dart';

class TaskController extends GetxController {
  NetworkController controller = Get.find();

  Rxn<SampleX> result = Rxn(null);
  RxBool requestResult = false.obs;

  Future<SampleX?> getTask([bool fail = false]) async {
    try {
      result.value = await (fail ? null : controller.client.getASample());
      requestResult.value = fail ? false : true;
      return result.value;
    } catch (e) {
      requestResult.value = false;
      return null;
    }
  }
}
