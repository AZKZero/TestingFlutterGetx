import 'package:floor/floor.dart';
import 'package:projectx/database/models/author.dart';
import 'package:projectx/database/models/blog.dart';
import 'package:projectx/database/models/generated/blog_author.dart';

@dao
abstract class BlogDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBlogs(List<Blog> blogs);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAuthors(List<Author> authors);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBlog(Blog blog);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAuthor(Author author);

  @Query("select * from blogs where id=:id")
  Future<Blog?> getBlogById(int id);

  @Query("select * from blogs")
  Stream<List<Blog>?> getBlogs();

  Stream<List<BlogAuthor?>?> getBlogAuthors() {
    return getBlogs().asyncMap((event) => event != null ? Future.wait(event.map((e) => getBlogAuthor(e.id)).toList()) : Future.delayed(const Duration(milliseconds: 1), () => null));
  }

  @Query("select * from authors where id=:id")
  Future<Author?> getAuthorById(int id);

  Future<BlogAuthor?> getBlogAuthor(int? blogId) async {
    if(blogId==null) return null;
    Blog? blog = await getBlogById(blogId);
    Author? author = await (blog != null && blog.authorId != null ? getAuthorById(blog.authorId!) : null);
    return (blog != null && author != null ? BlogAuthor(blog: blog, author: author) : null);
  }
}
