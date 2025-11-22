// import 'dart:async';
// import 'dart:convert';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:easyfycare_clinical_app/app/view/splash/splash_view.dart';
// import 'package:easyfycare_clinical_app/config.dart';
// import 'package:easyfycare_clinical_app/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
// import 'app/controller/main/main_controller.dart';
// import 'app/controller/teleconsultation/teleconsultation_controller.dart';
// import 'core/service/push_notification.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// Future<void> _firebaseBackgroundMessage(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   if (message.notification != null) {
//     print("Background notification received: ${message.notification?.title}");
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
//   await ZegoUIKitPrebuiltCallInvitationService().init(
//     appID: yourAppId,
//     appSign: yourAppSign,
//     userID: clinicInfo?.id.toString() ?? clinicSaveInfo?.id.toString() ?? "-",
//     userName: clinicInfo?.hospitalName ?? clinicSaveInfo?.hospitalName ?? "-",
//     plugins: [ZegoUIKitSignalingPlugin()],
//   );
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   // Initialize notification service after Firebase
//   await NotificationService.init();
//   String? token = await FirebaseMessaging.instance.getToken();
//   print("👉 FCM Token from main: $token");
//   await NotificationService.localNotiInit();

//   // Setup background handler
//   FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

//   // Handle when app is opened from a notification (background/tapped)
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     if (message.notification != null) {
//       print("Background Notification Tapped: ${message.notification?.title}");
//     }
//   });

//   // Handle app launch from terminated state
//   final RemoteMessage? initialMessage = await FirebaseMessaging.instance
//       .getInitialMessage();
//   if (initialMessage != null) {
//     print("App opened from terminated state with notification");
//     NotificationService.showSimpleNotification(
//       title: initialMessage.notification?.title ?? "",
//       body: initialMessage.notification?.body ?? "",
//       payload: jsonEncode(initialMessage.data),
//     );
//   }

//   // Crashlytics error handling
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   runZonedGuarded(() {
//     runApp(const MyApp());
//   }, FirebaseCrashlytics.instance.recordError);
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(1366, 1024),
//       builder: (_, __) {
//         return GetMaterialApp(
//           navigatorKey: navigatorKey,
//           title: 'Easyfycare Clinical App',
//           debugShowCheckedModeBanner: false,
//           initialBinding: BindingsBuilder(() {
//             Get.put(MainController());
//             Get.put(TeleconsultationController());
//           }),
//           theme: ThemeData(scaffoldBackgroundColor: Colors.white),
//           home: Stack(
//             children: [
//               SplashView(),
//               ZegoUIKitPrebuiltCallMiniOverlayPage(
//                 contextQuery: () {
//                   return navigatorKey.currentState!.context;
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
