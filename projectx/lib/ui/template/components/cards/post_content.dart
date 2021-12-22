import 'package:flutter/material.dart';
import 'package:projectx/database/models/server/post.dart';

class PostContent extends StatelessWidget {
  PostContent({Key? key, required this.post}) : super(key: key);

  Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    post.avatar ?? "",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.info, size: 15.0,),
                ),
              ),
              Container(
                height: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                child: Text(post.username??""),
              ),
            ],
          ),
        ),
        Text(post.description ?? ""),
      ],
    );
  }
}
