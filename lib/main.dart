import 'package:expense_app/main_page.dart';
import 'package:expense_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: MainPage(),
    );
  }
}

