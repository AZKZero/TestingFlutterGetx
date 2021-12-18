import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogLoginAlt extends StatelessWidget {
  DialogLoginAlt({Key? key, this.filled = false}) : super(key: key);

  bool filled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, minWidth: 10, minHeight: 10, maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  filled
                      ? ElevatedButton.icon(
                          onPressed: () => Get.back(result: {"result": "Facebook"}),
                          icon: const ImageIcon(
                            AssetImage("assets/images/icons/facebook.png"),
                            color: Colors.white,
                          ),
                          label: const Text("Facebook Auth"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF3245B8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                        )
                      : OutlinedButton.icon(
                          onPressed: () => Get.back(result: {"result": "Facebook"}),
                          icon: const ImageIcon(AssetImage("assets/images/icons/facebook.png")),
                          label: const Text("Facebook Auth"),
                          style: OutlinedButton.styleFrom(
                              primary: const Color(0xFF3245B8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), side: const BorderSide(color: Color(0xFF3245B8))),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  filled
                      ? ElevatedButton.icon(
                          onPressed: () => Get.back(result: {"result": "Google"}),
                          icon: const ImageIcon(
                            AssetImage("assets/images/icons/g.png"),
                            color: Colors.white,
                          ),
                          label: const Text("Google Auth"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFD54546),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                        )
                      : OutlinedButton.icon(
                          onPressed: () => Get.back(result: {"result": "Google"}),
                          icon: const ImageIcon(AssetImage("assets/images/icons/g.png")),
                          label: const Text("Google Auth"),
                          style: OutlinedButton.styleFrom(
                              primary: const Color(0xFFD54546), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), side: const BorderSide(color: Color(0xFFD54546))),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  filled
                      ? ElevatedButton.icon(
                          onPressed: () => Get.back(result: {"result": "Twitter????"}),
                          icon: const ImageIcon(
                            AssetImage("assets/images/icons/twitter.png"),
                            color: Colors.white,
                          ),
                          label: const Text("Twitter Auth????"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0091EA),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                        )
                      : OutlinedButton.icon(
                          onPressed: () => Get.back(result: {"result": "Twitter????"}),
                          icon: const ImageIcon(AssetImage("assets/images/icons/twitter.png")),
                          label: const Text("Twitter Auth????"),
                          style: OutlinedButton.styleFrom(
                              primary: const Color(0xFF0091EA), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), side: const BorderSide(color: Color(0xFF0091EA))),
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
