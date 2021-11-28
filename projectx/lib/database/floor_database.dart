import 'dart:async';

import 'package:floor/floor.dart';
import 'package:projectx/database/models/log_model.dart';
import 'package:projectx/database/provider/log_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart';

@Database(version: 1, entities: [Log])
abstract class ExtensionFloorDatabase extends FloorDatabase {
  LogDao get logDao;
}
