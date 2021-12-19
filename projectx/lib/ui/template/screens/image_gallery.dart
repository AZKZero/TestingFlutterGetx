import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';

class ImageGallery extends StatelessWidget {
  ImageGallery({Key? key}) : super(key: key) {
    _feedController.loadFeed();
  }

  final FeedController _feedController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: StreamBuilder<List<String>>(
          stream: _feedController.photos.stream,
          initialData: const [],
          builder: (context, snapshot) {
            List<String> data = snapshot.data ?? List<String>.empty();
            return GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => Image.network(
                data[index],
                cacheHeight: 200,
                cacheWidth: 200,
                filterQuality: FilterQuality.medium,
                fit: BoxFit.contain,
                height: 200,
                width: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}
