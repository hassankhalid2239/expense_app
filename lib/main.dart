import 'package:expense_app/Modals/money_model.dart';
import 'package:expense_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Database/prefrences.dart';
import 'Screens/main_page.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory= await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MoneyModelAdapter());
  await Hive.openBox<MoneyModel>('Records');
  var ref = await SharedPreferences.getInstance();
  String theme;
  if (ref.getString('theme') != null) {
    theme = ref.getString('theme')!;
  } else {
    theme = 'System Default';
  }
  runApp(MyApp(theme: theme,));
}

class MyApp extends StatelessWidget {
  MyApp({super.key,required this.theme});
  final String theme;
  final pref = SharedPref();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: theme == 'Light'
          ? ThemeMode.light
          : theme == 'Dark'
          ? ThemeMode.dark
          : ThemeMode.system,
      home: const MainPage(),
    );
  }
}

