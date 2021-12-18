import 'package:floor/floor.dart';

@Entity(tableName: "logs")
class Log {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? buttonClicked;
  String? dateButtonClickedOn;

  Log({this.id, this.buttonClicked, this.dateButtonClickedOn});
}
