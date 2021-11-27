import 'package:get/get.dart';
import 'package:projectx/testing_list.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const TestingList()),
  ];
}
