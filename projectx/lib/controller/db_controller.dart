import 'package:get/get.dart';
import 'package:projectx/database/floor_database.dart';
import 'package:projectx/database/provider/log_dao.dart';

class DBController extends GetxController {
  late final ExtensionFloorDatabase  database;
  late final LogDao logDao;

  Future<void> initializeDB() async {
    database = await $FloorExtensionFloorDatabase.databaseBuilder('app_database.db').build();
    logDao = database.logDao;
  }
}
