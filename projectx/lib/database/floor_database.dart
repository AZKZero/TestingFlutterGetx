import 'dart:async';

import 'package:floor/floor.dart';
import 'package:projectx/database/converters/list_converter.dart';
import 'package:projectx/database/models/application/author.dart';
import 'package:projectx/database/models/application/blog.dart';
import 'package:projectx/database/models/application/log_model.dart';
import 'package:projectx/database/provider/blog_dao.dart';
import 'package:projectx/database/provider/log_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart';

@Database(version: 2, entities: [Log, Blog, Author])
@TypeConverters([ListConverter])
abstract class ExtensionFloorDatabase extends FloorDatabase {
  LogDao get logDao;
  BlogDao get blogDao;
}
