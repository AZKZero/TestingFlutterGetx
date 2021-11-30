import 'package:drift/drift.dart';

// part 'tables.g.dart';

@DataClassName("blogs")
// @UseRowClass(AltBlog)
class Blogs extends Table {
  Column<int> get id => integer().autoIncrement()();

  Column<String> get title => text()();

  Column<String> get description => text()();

  Column<String> get coverPhoto => text().named("cover_photo")();
}

class AltBlog {
  int id;
  String title;
  String description;
  String coverPhoto;

  AltBlog({required this.id, required this.title, required this.description, required this.coverPhoto});
}
