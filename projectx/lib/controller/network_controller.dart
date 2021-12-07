import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projectx/client/retrofit_client.dart';

class NetworkController extends GetxController {
  final dio = Dio();
  late final RetrofitClient client;

  NetworkController() {
    dio.options.headers["X"] = "X";
    client = RetrofitClient(dio);
  }
}
