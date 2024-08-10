import 'package:expense_app/home_screen.dart';
import 'package:expense_app/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Constants{
  static List<Tab> getHomeScreenTbs(int index){
    return [
      Tab(
        text: 'Home',
      ),
      Tab(
        text: 'Categories',
      ),
      Tab(
        text: 'Report',
      ),
      Tab(
        text: 'More',
      ),
    ];
  }
  static List<Widget> screens=[
    HomeScreen(),
    const Center(child: Text('Report Screen',style: TextStyle(color: Colors.black)),),
    ReportScreen(),
    const Center(child: Text('More Screen',style: TextStyle(color: Colors.black)),),
  ];
}