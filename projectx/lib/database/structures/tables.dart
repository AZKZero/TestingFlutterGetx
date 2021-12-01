import 'package:drift/drift.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/list_converter.dart';

// part 'tables.g.dart';

@DataClassName("NewBlog")
// @UseRowClass(AltBlog)
class Blogs extends Table {
  Column<int?> get id => integer().autoIncrement().nullable()();

  Column<String?> get title => text().nullable()();

  Column<String?> get description => text().nullable()();

  @JsonKey("cover_photo")
  Column<String?> get coverPhoto => text().named("cover_photo").nullable()();

  Column<int?> get authorId => integer().named("author_id").nullable()();

  Column<String?> get categories => text().map(const ListConverter()).nullable()();
}

@DataClassName("Author")
class AuthorTable extends Table {
  Column<int?> get id => integer().autoIncrement().nullable()();

  Column<String?> get name => text().nullable()();

  Column<String?> get avatar => text().nullable()();

  Column<String?> get profession => text().nullable()();
}

@DataClassName("Log")
class LogTable extends Table {
  Column<int?> get id => integer().autoIncrement().nullable()();

  Column<String?> get buttonClicked => text().named("button_clicked").nullable()();

  Column<String?> get dateButtonClickedOn => text().named("date_button_clicked_on").nullable()();

}
