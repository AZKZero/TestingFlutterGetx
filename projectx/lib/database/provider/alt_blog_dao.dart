
import 'package:drift/drift.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/models/application/blog.dart';
import 'package:projectx/database/structures/tables.dart';

part 'alt_blog_dao.g.dart';

@DriftAccessor(tables: [Blogs])
class AltBlogDao extends DatabaseAccessor<AltDriftDatabase> with _$AltBlogDaoMixin{
  AltBlogDao(AltDriftDatabase driftDatabase): super(driftDatabase);


  Future<void> insertBlogs(List<Blog> blogsX) async {
    await batch((batch) => batch.insertAllOnConflictUpdate(blogs, blogsX));
  }
}