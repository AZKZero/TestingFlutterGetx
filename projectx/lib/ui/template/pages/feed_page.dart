import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/ui/misc/alt_colors.dart';
import 'package:projectx/ui/template/components/cards/post_card.dart';

class FeedPage extends StatelessWidget {
  FeedPage({Key? key}) : super(key: key);

  final FeedController _feedController = Get.find();

  final FocusNode _textFocusNode = FocusNode();

  final usernameSearch = "".obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(color: ColorsLight.appbar),
                  child: TextFormField(
                    focusNode: _textFocusNode,
                    onChanged: (value) => usernameSearch.value = value,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white, decorationColor: Colors.white),
                    decoration: const InputDecoration(
                        focusColor: Colors.white,
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Search"),
                  ),
                ),
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
                    .where((p0) => usernameSearch.value.isEmpty || (p0.username?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false))
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
            )));
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
