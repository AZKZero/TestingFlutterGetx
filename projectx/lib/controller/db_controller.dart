import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:projectx/database/floor_database.dart';
import 'package:projectx/database/provider/blog_dao.dart';
import 'package:projectx/database/provider/log_dao.dart';

class DBController extends GetxController {
  late final ExtensionFloorDatabase database;
  late final LogDao logDao;
  late final BlogDao blogDao;

  Future<void> initializeDB() async {
    database = await $FloorExtensionFloorDatabase.databaseBuilder('app_database.db').addMigrations([
      Migration(1, 2, (database) async {
        database.execute("DROP TABLE logs");
        database.execute("DROP TABLE blogs");
        database.execute("DROP TABLE authors");
      })
    ]).build();
    logDao = database.logDao;
    blogDao = database.blogDao;
  }
}
