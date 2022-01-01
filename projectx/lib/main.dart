import 'dart:async';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectx/controller/db_controller.dart';
import 'package:projectx/controller/factories/task_controller.dart';
import 'package:projectx/controller/selection_controller.dart';
import 'package:projectx/ui/misc/testing_list.dart';
import 'package:projectx/ui/misc/testing_list_2.dart';
import 'package:projectx/ui/misc/testing_list_3.dart';
import 'package:projectx/ui/misc/tile_button.dart';
import 'package:projectx/ui/styles/alt_colors.dart';
import 'package:projectx/ui/template/screens/bottom_nav.dart';
import 'package:projectx/ui/template/screens/landing_page.dart';
import 'package:projectx/ui/template/screens/login_screen.dart';
import 'package:projectx/ui/template/screens/testing_ground.dart';
import 'package:projectx/ui/test/activity_main.dart';
import 'package:projectx/utils/bindings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/factories/task_controller.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      //   'resource://drawable/res_app_icon',
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [NotificationChannelGroup(channelGroupkey: 'basic_channel_group', channelGroupName: 'Basic group')],
      debug: true);
  runApp(MyApp());
}

ThemeData _darkTheme = ThemeData(
  // brightness: Brightness.dark,
  primaryColor: Colors.amber,
  primaryColorDark: Colors.amber,
  primarySwatch: Colors.amber,
  colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.amber, brightness: Brightness.dark, secondary: Colors.red, onSurface: Colors.white, surface: ColorsDark.appbar),
);

ThemeData _lightTheme = ThemeData(
  // brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(primary: ColorsLight.linearGradientStart, brightness: Brightness.light, secondary: Colors.green),
);

RxBool currentThemeModeLight = true.obs;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

_saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('theme', currentThemeModeLight.value);
}

_getThemeStatus() async {
  currentThemeModeLight.value = await _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') ?? true;
  });
  Get.changeThemeMode(currentThemeModeLight.value ? ThemeMode.light : ThemeMode.dark);
}

changeThemeMode() {
  currentThemeModeLight.value = !currentThemeModeLight.value;
  Get.changeThemeMode(currentThemeModeLight.value ? ThemeMode.light : ThemeMode.dark);
  _saveThemeStatus();
}

class MyApp extends StatelessWidget {
  late DBController controllerDB;
  StreamSubscription<ReceivedAction>? listen;

  var bindings = AppBindings();

  MyApp({Key? key}) : super(key: key) {
    _getThemeStatus();

    /*controllerDB = DBController();
    controllerDB.initializeDB();*/
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    listen ??= AwesomeNotifications().actionStream.listen((ReceivedAction receivedAction) {
      log("notification ${receivedAction.buttonKeyPressed} ${receivedAction.groupKey} ${receivedAction.channelKey}");
    }); /* else {
      listen?.cancel().then((value) => listen = AwesomeNotifications().actionStream.listen((ReceivedAction receivedAction) {
            log("notification ${receivedAction.buttonKeyPressed} ${receivedAction.groupKey} ${receivedAction.channelKey}");
          }));
    }*/
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.light,
      // initialBinding: bindings,
      // home: NewHomePage(title: 'Flutter Demo Home Page'),
      // home: LandingScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LandingScreen(), binding: bindings),
        GetPage(name: '/login', page: () => LoginScreen(), binding: bindings),
        GetPage(name: '/home', page: () => BottomNav(), binding: bindings),
        // GetPage(name: '/', page: () => LandingScreen(), binding: bindings),
      ],
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
  NewHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    TaskController controllerT = Get.find();
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
              OutlinedButton(
                  onPressed: () {
                    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
                      if (!isAllowed) {
                        // This is just a basic example. For real apps, you must show some
                        // friendly dialog box before call the request method.
                        // This is very important to not harm the user experience
                        AwesomeNotifications().requestPermissionToSendNotifications();
                      } else {
                        Get.to(ActivityMain());
                      }
                    });
                  },
                  child: const Text("Blog List 1")),
              OutlinedButton(
                  onPressed: () {
                    Get.to(UITestingGrounds());
                  },
                  child: const Text("UI Testing ground"))
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
                // if (controllerT.requestResult.value)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    /*controllerT.requestResult.value ? */
                    controllerT.result.value?.toString() ?? "N/A" /* : "Failed"*/,
                    maxLines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SimpleTileButton(
                    buttonTitle: "TestRetrofit: Should Succeed",
                    onPressed: () => controllerT.getTask(),
                    buttonBack: controllerT.requestResult.value ? Colors.green : Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SimpleTileButton(
                    buttonTitle: "TestRetrofit: Should Fail",
                    onPressed: () => controllerT.getTask(true),
                    buttonBack: /* controllerT.requestResult.value ? Colors.green : */ Colors.red,
                  ),
                ),
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
