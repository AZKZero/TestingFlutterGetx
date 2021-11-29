import 'package:projectx/database/models/application/author.dart';
import 'package:projectx/database/models/application/blog.dart';

class BlogAuthor {
  Blog blog;
  Author author;

  BlogAuthor({required this.blog, required this.author});
}
