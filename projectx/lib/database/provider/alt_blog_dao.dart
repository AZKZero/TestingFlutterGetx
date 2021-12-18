import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/database/models/application/blog.dart';
import 'package:projectx/database/models/generated/blog_author.dart';
import 'package:projectx/database/structures/tables.dart';

part 'alt_blog_dao.g.dart';

@DriftAccessor(tables: [
  Blogs,
  AuthorTable
], queries: {
  'getBlogCustomQuery': 'SELECT * FROM blogs WHERE id=:id',
  'getBlogIds': 'SELECT id, title FROM blogs',
  'getBlogsCount': 'SELECT COUNT(*) FROM blogs',
  'getBlogAuthorsRaw': 'select blog.**, author.** from blogs blog, author_table author where blog.author_id=author.id',
  'getBlogAuthorsRawV2': 'select * from blogs inner join author_table author on author.id=blogs.author_id'
})
class AltBlogDao extends DatabaseAccessor<AltDriftDatabase> with _$AltBlogDaoMixin {
  AltBlogDao(AltDriftDatabase driftDatabase) : super(driftDatabase);

  Future<List<NewBlog>?> getBlogs() => select(blogs).get();

  Stream<List<NewBlog>?> getBlogsAsStream() => select(blogs).watch();

  Stream<List<int?>?> getBlogIdsAsStream() {
    var blogIds = blogs.id;
    return (selectOnly(blogs)..addColumns([blogIds])).map((row) => row.read(blogIds)).watch();
  }

  Future<int> getBlogsCountDart() {
    var blogIdCount = blogs.id.count();
    return (selectOnly(blogs)..addColumns([blogIdCount])).map((row) => row.read(blogIdCount)).getSingle();
  }

  Future<NewBlog?> getBlogById(int id) => (select(blogs)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<void> insertBlogs(List<NewBlog> blogsX) async => await batch((batch) => batch.insertAllOnConflictUpdate(blogs, blogsX));

  Future<void> insertBlogsV2(List<Blog> blogsX) async => await batch((batch) => batch.insertAllOnConflictUpdate(blogs, blogsX));

  Future<void> insertBlogAuthorV2(List<Blog> blogsX) {
    return transaction(() async {
      await insertBlogsV2(blogsX);
      await insertAuthors(blogsX.map((e) => e.author!).toList());
    });
  }

  Future<List<Author>?> getAuthors() => select(authorTable).get();

  Future<Author?> getAuthorById(int id) => (select(authorTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<void> insertAuthors(List<Author> authorX) async => await batch((batch) => batch.insertAllOnConflictUpdate(authorTable, authorX));

  Future<BlogAuthor?> getBlogAuthor(int? blogId) async {
    log("Hitting BlogAuthor with $blogId");
    if (blogId == null) return null;
    // NewBlog? blog = await getBlogById(blogId);
    NewBlog? blog = await getBlogCustomQuery(blogId).getSingleOrNull();
    log("Found blog ${blog?.toJson()}");
    Author? author = await (blog != null && blog.authorId != null ? getAuthorById(blog.authorId!) : null);
    log("Found author ${author?.toJson()}");
    return (blog != null && author != null ? BlogAuthor(blog: blog, author: author) : null);
  }

  Stream<List<BlogAuthor?>?> getBlogAuthors() {
    log("Hitting Stream");
    return getBlogIdsAsStream().asyncMap((event) => event != null ? Future.wait(event.map((e) => getBlogAuthor(e)).toList()) : Future.delayed(const Duration(milliseconds: 1), () => null));
  }
}
