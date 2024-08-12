import 'package:expense_app/Modals/money_model.dart';
import 'package:expense_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/main_page.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory= await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MoneyModelAdapter());
  await Hive.openBox<MoneyModel>('Records');
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

      home: const MainPage(),
    );
  }
}

