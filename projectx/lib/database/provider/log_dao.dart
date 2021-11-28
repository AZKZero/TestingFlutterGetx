import 'package:floor/floor.dart';
import 'package:projectx/database/models/log_model.dart';

@dao
abstract class LogDao {
  @Query("SELECT * FROM logs")
  Stream<List<Log>> getAllLogsAsStream();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertLog(Log log);

  @Query("DELETE FROM logs")
  Future<void> deleteLogs();
}
