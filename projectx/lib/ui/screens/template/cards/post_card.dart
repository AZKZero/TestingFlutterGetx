import 'package:flutter/material.dart';
import 'package:projectx/database/models/server/post.dart';

class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.post}) : super(key: key);

  Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.75),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    post.avatar ?? "",
                    height: 30,
                    width: 30,
                  ),
                  const Icon(Icons.info),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              Text(post.description ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
