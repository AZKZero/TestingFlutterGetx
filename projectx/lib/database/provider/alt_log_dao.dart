import 'package:drift/drift.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/structures/tables.dart';

part 'alt_log_dao.g.dart';

@DriftAccessor(tables: [LogTable])
class AltLogDao extends DatabaseAccessor<AltDriftDatabase> with _$AltLogDaoMixin {
  AltLogDao(AltDriftDatabase driftDatabase) : super(driftDatabase);

  Stream<List<Log>> getAllLogsAsStream() => select(logTable).watch();

  Future<void> insertLog(Log log) => into(logTable).insert(log);

  Future<void> deleteAllLogs() => delete(logTable).go();
}
