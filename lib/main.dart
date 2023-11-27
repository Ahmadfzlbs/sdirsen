import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sdirbinsen/login/login.dart';
import 'package:sdirbinsen/sidebar.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin - SDIRBINSEN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: bgColor,
        canvasColor: bgColor,
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
