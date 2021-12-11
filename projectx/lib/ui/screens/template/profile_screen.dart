import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projectx/ui/components/alt_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            Container(
              constraints: BoxConstraints(maxHeight: height * 0.4),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    child: Image.network(
                      "https://images2.imgbox.com/87/5f/fuh4LAWO_o.jpg",
                      height: height * 0.30,
                      width: width,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Image.network(
                      "https://images2.imgbox.com/03/c9/aFz0kgzr_o.jpg",
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
            )
          ],
        ),
      ),
    );
  }
}
