import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/factories/blog_controller.dart';
import 'package:projectx/database/models/generated/blog_author.dart';
import 'package:projectx/ui/components/lists/list_base_3.dart';

class ActivityMain extends StatelessWidget {
  ActivityMain({Key? key}) : super(key: key);

  final BlogController blogController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Database"),
        backgroundColor: Colors.red,
      ),
      body: MixinBuilder<BlogController>(
        init: blogController,
        builder: (controller) {
          controller.getBlogs();
          return Column(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    if (controller.requestInFlight.value)
                      const Positioned(
                        child: CircularProgressIndicator.adaptive(
                          value: null,
                        ),
                      ),
                    if (!controller.requestInFlight.value)
                      Positioned.fill(
                        child: StreamBuilder<List<BlogAuthor?>?>(
                          initialData: const [],
                          stream: blogController.controllerDB.blogDao.getBlogAuthors(),
                          builder: (context, snapshot) {
                            List<BlogAuthor?>? data = snapshot.data;
                            return data != null
                                ? data.isNotEmpty == true
                                    ? ListBlog(items: data)
                                    : const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Empty"),
                                      )
                                : const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Null"),
                                  );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
