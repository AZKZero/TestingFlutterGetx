import 'package:drift/drift.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/models/server/post.dart';
import 'package:projectx/database/structures/tables.dart';

part 'alt_post_dao.g.dart';

@DriftAccessor(tables: [PostTable], queries: {'getPosts': "SELECT * FROM post_table", "getPostCount": "SELECT COUNT(*) FROM post_table"})
class AltPostDao extends DatabaseAccessor<AltDriftDatabase> with _$AltPostDaoMixin {
  AltPostDao(AltDriftDatabase driftDatabase) : super(driftDatabase);

  Future<void> savePosts(List<Post> posts) async => await batch((batch) => batch.insertAllOnConflictUpdate(postTable, posts));

  Future<void> savePostsInternal(List<PostInternal> posts) async => await batch((batch) => batch.insertAllOnConflictUpdate(postTable, posts));

  Future<void> savePost(PostInternal post) async => await into(postTable).insertOnConflictUpdate(post);
}
