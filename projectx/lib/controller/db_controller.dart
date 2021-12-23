import 'package:get/get.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/provider/alt_blog_dao.dart';
import 'package:projectx/database/provider/alt_log_dao.dart';
import 'package:projectx/database/provider/alt_post_dao.dart';

class DBController extends GetxController {
  // late final ExtensionFloorDatabase database;
  // late final LogDao logDao;
  // late final BlogDao blogDao;
  AltBlogDao? blogDao;
  AltLogDao? logDao;
  AltDriftDatabase? database;
  AltPostDao? postDao;

  Future<void> initializeDB() async {
    /*database = await $FloorExtensionFloorDatabase.databaseBuilder('app_database.db').addMigrations([
      Migration(1, 2, (database) async {
        database.execute("DROP TABLE logs");
        database.execute("DROP TABLE blogs");
        database.execute("DROP TABLE authors");
      })
    ]).build();
    logDao = database.logDao;
    blogDao = database.blogDao;*/
    database = AltDriftDatabase();
    blogDao = database?.altBlogDao;
    logDao = database?.altLogDao;
    postDao = database?.altPostDao;
  }
}
