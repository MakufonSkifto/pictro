import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:pictro/pages/main_pages/home_page/home_page.dart';
import 'package:pictro/pages/main_pages/start_page.dart';
import 'package:pictro/utils/auth.dart';
import 'package:pictro/utils/constants.dart';
import 'package:pictro/firebase_options.dart';
import 'package:pictro/injection_container.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Injection Container
  await sl.init();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    name: "pictro",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.deviceCheck,
  );

  Get.put(Authentication());

  var currentUser = FirebaseAuth.instance.currentUser;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  }

  if (currentUser != null && currentUser.displayName != null) {
    runApp(const MyApp(home: HomePage()));
  } else {
    runApp(const MyApp(home: StartPage()));
  }
}

class MyApp extends StatelessWidget {
  final Widget home;

  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pictro",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87, secondary: Colors.black),
        useMaterial3: true,
        dialogTheme: const DialogTheme(
          contentTextStyle: TextStyle(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.black
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white
        ),
        fontFamily: geologicaRegular,
        cardColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white)
        ).apply(
          bodyColor: Colors.white.withOpacity(.9),
          displayColor: Colors.white.withOpacity(.9)
        )
      ),
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
