import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/testing_list.dart';
import 'package:projectx/testing_list_2.dart';
import 'package:projectx/testing_list_3.dart';
import 'package:projectx/tile_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DBController controllerDB = DBController();
  await controllerDB.initializeDB();
  runApp(MyApp(controllerDB));
}

class MyApp extends StatelessWidget {
  final DBController controllerDB;

  const MyApp(this.controllerDB, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() => {Get.put(controllerDB), Get.put(SelectionController())}),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const NewHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class NewHomePage extends StatelessWidget {
  const NewHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             /* const FractionallySizedBox(
                heightFactor: 0.2,
                widthFactor: 1,
              ),*/
              OutlinedButton(
                  onPressed: () {
                    Get.to(const TestingList());
                  },
                  child: const Text("Test List 1")),
              OutlinedButton(
                  onPressed: () {
                    Get.to(TestingListWithoutMixin());
                  },
                  child: const Text("Test List 2")),
              OutlinedButton(
                  onPressed: () {
                    Get.to(TestingDBList());
                  },
                  child: const Text("DB List 1")),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: MixinBuilder<SelectionController>(
        init: SelectionController(),
        builder: (controller) => Center(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: [
                Expanded(
                    child: Column(
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Row(
                      children: [
                        Expanded(child: TileButton(controller: controller, buttonTitle: "QMS", buttonBack: Colors.lime)),
                        Expanded(child: TileButton(controller: controller, buttonTitle: "Project", buttonBack: Colors.orangeAccent)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: TileButton(controller: controller, buttonTitle: "Form", buttonBack: Colors.blue)),
                        Expanded(child: TileButton(controller: controller, buttonTitle: "Documents", buttonBack: Colors.amber)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: TileButton(controller: controller, buttonTitle: "Tickets", buttonBack: Colors.teal)),
                        Expanded(child: TileButton(controller: controller, buttonTitle: "Assets", buttonBack: Colors.red)),
                      ],
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                  child: Text(
                    'Currently selected: ${controller.currentText.value}',
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      /*body: Center(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Row(
                children: const [
                  TileButton(buttonTitle: "QMS", buttonBack: Colors.lime),
                  TileButton(buttonTitle: "Project", buttonBack: Colors.orangeAccent),
                ],
              ),
              Row(
                children: const [
                  TileButton(buttonTitle: "Form", buttonBack: Colors.blue),
                  TileButton(buttonTitle: "Documents", buttonBack: Colors.amber),
                ],
              ),
              Row(
                children: const [
                  TileButton(buttonTitle: "Tickets", buttonBack: Colors.teal),
                  TileButton(buttonTitle: "Assets", buttonBack: Colors.red),
                ],
              ),
            ],
          )),*/
    );
  }
}
