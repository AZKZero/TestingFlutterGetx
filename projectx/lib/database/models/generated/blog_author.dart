import 'package:projectx/database/models/author.dart';
import 'package:projectx/database/models/blog.dart';

class BlogAuthor {
  Blog blog;
  Author author;

  BlogAuthor({required this.blog, required this.author});
}
