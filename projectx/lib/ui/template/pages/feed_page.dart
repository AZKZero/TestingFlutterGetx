import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/controller/user_controller.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/ui/misc/interfaces/titled_page.dart';
import 'package:projectx/ui/styles/alt_colors.dart';
import 'package:projectx/ui/template/components/cards/post_card.dart';

class FeedPage extends StatelessWidget implements TitledPage {
  @override
  String get title => "Feed";

  FeedPage({
    Key? key,
    required this.onEdit,
  }) : super(key: key) {
    // filtered = _feedController.getFeed();
    _feedController.loadFeed();
    feed = _feedController.getFeed("");
  }

  final FeedController _feedController = Get.find();
  final UserController _userController = Get.find();

  final FocusNode _textFocusNode = FocusNode();

  final usernameSearch = "".obs;
  Function(PostInternal post) onEdit;
  Stream<List<PostInternal>>? feed;

  // late final RxList<Post> filtered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => _feedController.showSearch.value
            ? Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(color: ColorsLight.appbar),
                child: TextFormField(
                  focusNode: _textFocusNode,
                  onChanged: (value) {
                    usernameSearch.value = value;
                    /*filtered.value = _feedController.feed
                      .where((p0) =>
                          usernameSearch.value.isEmpty ||
                          (p0.username?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false) ||
                          (p0.description?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false))
                      .toList();*/
                  },
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
              )
            : const SizedBox(height: 0)),
        Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.95, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.1),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                      "https://i.pravatar.cc/250",
                      height: 50,
                      width: 50,
                    ),
                  )),
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
        Expanded(
            child: StreamBuilder<List<PostInternal>?>(
                stream: feed,
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? Obx(() {
                          var filtered = snapshot.data!
                              .where((p0) =>
                                  usernameSearch.value.isEmpty ||
                                  (p0.username?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false) ||
                                  (p0.description?.toLowerCase().contains(usernameSearch.value.toLowerCase()) ?? false))
                              .toList();
                          return ListView.builder(
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              var element = filtered[index];
                              return Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.95,
                                  minWidth: 10,
                                ),
                                child: PostCard(
                                    post: element,
                                    highlight: element.username == _userController.user.value?.username,
                                    onPressed: () => element.username == _userController.user.value?.username ? onEdit(element) : null),
                              );
                            },
                          );
                        })
                      : const Text("Empty");
                })),
      ],
    );
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
