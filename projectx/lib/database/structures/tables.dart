import 'package:drift/drift.dart';

// part 'tables.g.dart';

@DataClassName("blogs")
class Blogs extends Table {
  Column<int> get id => integer().autoIncrement()();

  Column<String> get title => text()();

  Column<String> get description => text()();

  Column<String> get coverPhoto => text().named("cover_photo")();

}
