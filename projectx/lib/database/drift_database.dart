import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:projectx/database/provider/alt_blog_dao.dart';
import 'package:projectx/database/provider/alt_log_dao.dart';
import 'package:projectx/database/provider/alt_post_dao.dart';
import 'package:projectx/database/structures/tables.dart';

part 'drift_database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Blogs, AuthorTable, LogTable, PostTable], daos: [AltBlogDao, AltLogDao, AltPostDao])
class AltDriftDatabase extends _$AltDriftDatabase {
  // we tell the database where to store the data with this constructor
  AltDriftDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        await Future.wait([m.deleteTable("blogs"), m.deleteTable("author_table"), m.deleteTable("log_table")]);
      });
}

class ListConverter extends TypeConverter<List<String>, String> {
  const ListConverter();

  @override
  List<String>? mapToDart(String? fromDb) => fromDb == null ? null : (jsonDecode(fromDb) as List<dynamic>).cast<String>();

  @override
  String? mapToSql(List<String>? value) => jsonEncode(value);

/*@override
  List<String>? decode(String? databaseValue) => jsonDecode(databaseValue??"null") as List<String>?;

  @override
  String? encode(List<String>? value) => jsonEncode(value);*/
}

/*class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter(T);

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic> &&
        json.containsKey('name') &&
        json.containsKey('size')) {
      return T.fromJson(json);
    }
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  // This will only work if `object` is a native JSON type:
  //   num, String, bool, null, etc
  // Or if it has a `toJson()` function`.
  @override
  Object? toJson(T object) => object;
}*/

class AuthorConverter implements JsonConverter<Author?, Map<String, dynamic>?> {
  const AuthorConverter();

  @override
  Author? fromJson(Map<String, dynamic>? json) => json == null ? null : Author.fromJson(json);

  @override
  Map<String, dynamic>? toJson(Author? object) => object?.toJson();
}
