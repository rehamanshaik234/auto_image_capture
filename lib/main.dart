import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:quamtum_it_solutions/image_picker.dart';
import 'package:quamtum_it_solutions/http_response/http_response.dart';
import 'package:quamtum_it_solutions/main_view/home.dart';
import 'package:quamtum_it_solutions/used_main_view/login_page.dart';

import 'firebase_options.dart';

const AndroidNotificationChannel channel= AndroidNotificationChannel(
    "high_impt_channel",
    "high important notificATION",importance: Importance.high,playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=
FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A big iuhfiu: ${message.messageId}');
}
 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
  );
  await Hive.initFlutter();
  var box= await Hive.openBox('News');
  var box2= await Hive.openBox('Authentication');
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HttpResponse()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData(
        primarySwatch: Colors.grey,
        inputDecorationTheme: const InputDecorationTheme(
        ),
      ),
      home:HomePage2()
    );
  }
}

