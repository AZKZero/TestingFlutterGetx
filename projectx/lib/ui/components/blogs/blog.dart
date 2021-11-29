import 'package:flutter/material.dart';
import 'package:projectx/database/models/generated/blog_author.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key, required this.blogAuthor}) : super(key: key);

  final BlogAuthor blogAuthor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Wrap(
              children: [
                Image.network(blogAuthor.blog.coverPhoto ?? ""),
                Text(
                  blogAuthor.blog.title ?? "",
                  style: const TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(blogAuthor.blog.description ?? ""),
            Row(
              children: [
                Image.network(
                  blogAuthor.author.avatar ?? "",
                  scale: 0.5,
                ),
                Text(blogAuthor.author.name ?? ""),
                Text(blogAuthor.author.profession ?? "")
              ],
            ),
            Wrap(
              children: [...(blogAuthor.blog.categories?.map((e) => Text(e)).toList() ?? List.filled(1, const Text("No Items")))],
            )
          ],
        ),
      ),
    );
  }
}
