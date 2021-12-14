import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:projectx/ui/components/alt_colors.dart';
import 'package:projectx/ui/screens/template/cards/card_style_1.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var switchState1 = false.obs;
  var switchState2 = false.obs;
  var switchState3 = false.obs;
  var switchState4 = false.obs;

  double? loadProgress(ImageChunkEvent loadingProgress) {
    var downloaded = loadingProgress.cumulativeBytesLoaded;
    var total = loadingProgress.expectedTotalBytes;

    return total == null
        ? null
        : total == 0
            ? 0
            : downloaded / total;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsLight.appbar,
        // foregroundColor: Colors.transparent,
        centerTitle: true,
        // flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(value: const SystemUiOverlayStyle().copyWith(statusBarColor: ColorsLight.appbar), child: Container()),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        // title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.30 + width * 0.1,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                  child: Image.network(
                    "https://images2.imgbox.com/87/5f/fuh4LAWO_o.jpg",
                    loadingBuilder: (context, child, loadingProgress) => Center(
                      child: loadingProgress != null
                          ? CircularProgressIndicator(
                              value: loadProgress(loadingProgress),
                            )
                          : child,
                    ),
                    height: height * 0.3,
                    width: width,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Image.network(
                    "https://images2.imgbox.com/03/c9/aFz0kgzr_o.jpg",
                    loadingBuilder: (context, child, loadingProgress) => Center(
                      child: loadingProgress != null
                          ? CircularProgressIndicator(
                              value: loadProgress(loadingProgress),
                            )
                          : child,
                    ),
                    height: width * 0.2,
                    fit: BoxFit.cover,
                    width: width * 0.2,
                    errorBuilder: (context, error, stackTrace) {
                      log("Stacktrace: $stackTrace");
                      return Text(error.toString());
                    },
                  ),
                  top: height * 0.3 - width * 0.1,
                  left: width * 0.05,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      switchState1.value = false;
                      switchState2.value = false;
                      switchState3.value = false;
                      switchState4.value = false;
                    },
                    child: Text(" ${switchState1.value} ${switchState2.value} ${switchState3.value} ${switchState4.value} "),
                  ),
                  CardStyle1(
                    headerText: "Titles",
                    content: Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(child: Text("Item 1")),
                          ],
                        ),
                        Row(
                          children: const [Expanded(child: Text("Item 2"))],
                        ),
                        Row(
                          children: const [
                            Expanded(child: Text("Item 3")),
                          ],
                        ),
                        Row(
                          children: const [
                            Expanded(child: Text("Item 4")),
                          ],
                        )
                      ],
                    ),
                  ),
                  CardStyle1(
                    headerText: "Switches",
                    content: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Text("Item 1")),
                            Switch(
                              value: switchState1.value,
                              onChanged: (value) => switchState1.value = value,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child: Text("Item 2")),
                            Switch(
                              value: switchState2.value,
                              onChanged: (value) => switchState2.value = value,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child: Text("Item 3")),
                            Switch(
                              value: switchState3.value,
                              onChanged: (value) => switchState3.value = value,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child: Text("Item 4")),
                            Switch(
                              value: switchState4.value,
                              onChanged: (value) => switchState4.value = value,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
