import 'package:flutter/material.dart';
import 'package:projectx/database/models/generated/blog_author.dart';
import 'package:projectx/ui/misc/blogs/blog.dart';

class ListBlog extends StatelessWidget {
  const ListBlog({Key? key, required this.items}) : super(key: key);

  final List<BlogAuthor?> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          BlogAuthor? blogAuthor = items[index];
          return blogAuthor != null
              ? BlogItem(blogAuthor: blogAuthor)
              : Card(
                  shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("N/A"),
                  ),
                );
        });
  }
}
