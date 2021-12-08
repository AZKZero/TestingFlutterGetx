import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/ui/components/alt_colors.dart';
import 'package:projectx/ui/screens/template/cards/post_card.dart';

class Feed extends StatelessWidget {
  Feed({Key? key}) : super(key: key) {
    _feedController.loadFeed();
  }

  final FeedController _feedController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [ColorsLight.linearGradientStart, ColorsLight.linearGradientEnd])),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Center(
          child: Text("Feed"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._feedController.feed.map((element) => PostCard(post: element, onPressed: () => Get.back(result: {"result": element.toJson()})))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

/*
ListView.builder(
                shrinkWrap: true,
                itemCount: _feedController.feed.length,
                itemBuilder: (context, index) {
                  var post = _feedController.feed[index];
                  return PostCard(
                    post: post,
                    onPressed: () => Get.back(result: {"result": post.toJson()}),
                  );
                },
              )
 */
