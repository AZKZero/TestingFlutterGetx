import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectx/database/models/server/post.dart';

class PostCard extends StatelessWidget {
  PostCard({Key? key, required this.post, required this.onPressed}) : super(key: key);

  Post post;

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 0.0,
              offset: const Offset(0,4)
            )
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(7.0)),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.all(8.0), height: 46, child: Text(post.username ?? "")),
                    ],
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
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
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
