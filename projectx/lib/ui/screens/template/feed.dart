import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsLight.appbar,
          // foregroundColor: Colors.transparent,

          // flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(value: const SystemUiOverlayStyle().copyWith(statusBarColor: ColorsLight.appbar), child: Container()),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Center(
            child: Text("Feed"),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.95, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.1),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _feedController.categories.length,
                      itemBuilder: (context, index) {
                        var image = _feedController.categories[index].image;
                        return image != null
                            ? Image.asset(
                                image,
                                height: MediaQuery.of(context).size.height * 0.1,
                              )
                            : const Text("No Image Found");
                      },
                    ),
                  ),
                  ..._feedController.feed
                      .map((element) => Center(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.95,
                                minWidth: 10,
                              ),
                              child: PostCard(
                                post: element,
                                onPressed: () => Get.back(result: {"result": element.toJson()}),
                              ),
                            ),
                          ))
                      .toList(),
                  /*Flexible(
                child: ListView.builder(
                  itemCount: _feedController.feed.length,
                  itemBuilder: (context, index) {
                    var post = _feedController.feed[index];
                    return ;
                  },
                )),*/
                ],
              )),
        ));
  }
}

/*
SingleChildScrollView(
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
      )
 */

/*
Obx(() => Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.95, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.1),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _feedController.categories.length,
                  itemBuilder: (context, index) {
                    var image = _feedController.categories[index].image;
                    return image != null
                        ? Image.asset(
                            image,
                            height: MediaQuery.of(context).size.height * 0.1,
                          )
                        : const Text("No Image Found");
                  },
                ),
              ),
              Flexible(
                  child: ListView.builder(
                itemCount: _feedController.feed.length,
                itemBuilder: (context, index) {
                  var post = _feedController.feed[index];
                  return Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.95,
                        minWidth: 10,
                      ),
                      child: PostCard(
                        post: post,
                        onPressed: () => Get.back(result: {"result": post.toJson()}),
                      ),
                    ),
                  );
                },
              )),
            ],
          )),
 */
