import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);

  var currentIndex=0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (value) => currentIndex.value=value,

          items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home,
              color: Colors.green,
            ),
            label: "HOME"),
        /*BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications),
            activeIcon: Icon(
              Icons.circle_notifications,
              color: Colors.green,
            ),
            label: "BELL"),*/
        BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            activeIcon: Icon(
              Icons.offline_bolt,
              color: Colors.green,
            ),
            label: "BELL"),
      ])),
    );
  }
}
