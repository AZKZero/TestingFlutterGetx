import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectx/database/models/server/post.dart';

class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.post, required this.onPressed}) : super(key: key);

  Post post;

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.75),
      child: Card(
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Image.network(
                          post.avatar ?? "",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                        child: const Icon(
                          Icons.info,
                          size: 10.0,
                        ),
                      ),
                      Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.all(8.0), height: 30, child: Text(post.username ?? "")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(child: Text(post.description ?? "")),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.comment), label: Text(post.comments?.toString() ?? "")),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.favorite), label: Text(post.likes?.toString() ?? "")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.fromLTRB(8.0,8.0,0,8.0),
                      child: Image.network(
                        post.avatar ?? "",
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.fromLTRB(0,0,0,8.0),
                      child: const Icon(
                        Icons.info,
                        size: 10.0,
                      ),
                    ),
                    Column(
                      children: [
                        Flexible(
                          child: Container(alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(8.0),
                              height: 30,
                              child: Text(post.username ?? "")),
                        ),
                      ],
                    )
                  ],
                ),
 */
