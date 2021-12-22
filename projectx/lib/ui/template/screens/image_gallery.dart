import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/feed_controller.dart';
import 'package:projectx/ui/template/components/grid/quilted.dart';
import 'package:projectx/ui/template/components/image_loader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            return GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => GestureDetector(
                        onTap: () => Get.back(result: {"result": data[index]}),
                        child: Image.network(
                          data[index],
                          /*cacheHeight: 200,
                          cacheWidth: 200,*/
                          /*filterQuality: FilterQuality.medium,
                          fit: BoxFit.contain,*/
                          /*height: 200,
                          width: 200,*/
                          loadingBuilder: (context, child, loadingProgress) => ImageLoaderWidget(/*height: 200, width: 200,*/ child: child, loadingProgress: loadingProgress),
                        ),
                      ),
                  childCount: data.length),
            );
          },
        ),
      ),
    );
  }
}
