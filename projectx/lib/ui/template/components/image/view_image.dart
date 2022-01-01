import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectx/database/drift_database.dart';
import 'package:projectx/ui/template/components/image/image_loader.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key, required this.image, required this.post}) : super(key: key);

  final String image;
  final PostInternal post;

  static launch({required String image, required PostInternal post}) async {
    await Get.to(() => ViewImage(image: image, post: post));
    if (Get.context?.orientation != Orientation.portrait) {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
                loadingBuilder: (context, child, loadingProgress) => ImageLoaderWidget(child: child, loadingProgress: loadingProgress),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.2),
                  decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.grey.withOpacity(0.6), Colors.transparent])),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icons/Heart.png",
                                fit: BoxFit.contain,
                                // width: MediaQuery.of(context).size.height * 0.05,
                                // height: MediaQuery.of(context).size.height * 0.05,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                post.likes?.toString() ?? "",
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icons/speech-bubble.png",
                                fit: BoxFit.contain,
                                // width: MediaQuery.of(context).size.height * 0.05,
                                // height: MediaQuery.of(context).size.height * 0.05,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                post.comments?.toString() ?? "",
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          )),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.fullscreen),
                        onPressed: () {
                          if (Get.context?.orientation != Orientation.portrait) {
                            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
                          } else {
                            SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
                          }
                        },
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
