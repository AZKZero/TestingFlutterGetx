import 'package:get/get.dart';
import 'package:projectx/ui/misc/testing_list.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const TestingList()),
  ];
}
