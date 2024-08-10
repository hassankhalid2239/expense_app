import 'package:expense_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Screens/categories_screen.dart';
import '../Screens/report_screen.dart';

class IncomeCategory{
  String title;
  String icon;
  IncomeCategory({required this.icon,required this.title});
}
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
    CategoriesScreen(),
    ReportScreen(),
    const Center(child: Text('More Screen',style: TextStyle(color: Colors.black)),),
  ];
  static List<IncomeCategory> incomeCategoryIcons = [
    IncomeCategory(icon: 'assets/svg/bills.svg', title: 'Bills'),
    IncomeCategory(icon: 'assets/svg/education.svg', title: 'Education'),
    IncomeCategory(icon: 'assets/svg/fun.svg', title: 'Fun'),
    IncomeCategory(icon: 'assets/svg/food.svg', title: 'Food'),
    IncomeCategory(icon: 'assets/svg/health.svg', title: 'Health'),
    IncomeCategory(icon: 'assets/svg/home.svg', title: 'Home'),
    IncomeCategory(icon: 'assets/svg/personal.svg', title: 'Personal'),
    IncomeCategory(icon: 'assets/svg/sports.svg', title: 'Sports'),
    IncomeCategory(icon: 'assets/svg/shop.svg', title: 'Shopping'),
    IncomeCategory(icon: 'assets/svg/subscription.svg', title: 'Subscriptions'),
    IncomeCategory(icon: 'assets/svg/salary.svg', title: 'Salary'),
    IncomeCategory(icon: 'assets/svg/social.svg', title: 'Social'),
    IncomeCategory(icon: 'assets/svg/transportation.svg', title: 'Transportation'),
    IncomeCategory(icon: 'assets/svg/tax.svg', title: 'Tax'),
    IncomeCategory(icon: 'assets/svg/work.svg', title: 'Work'),
    IncomeCategory(icon: 'assets/svg/others.svg', title: 'Others'),
  ];
  static List<IncomeCategory> expenseCategoryIcons = [
    IncomeCategory(icon: 'assets/svg/awards.svg', title: 'Awards'),
    IncomeCategory(icon: 'assets/svg/grants.svg', title: 'Grants'),
    IncomeCategory(icon: 'assets/svg/loan.svg', title: 'Loan'),
    IncomeCategory(icon: 'assets/svg/refund.svg', title: 'Refunds'),
    IncomeCategory(icon: 'assets/svg/salary.svg', title: 'Salary'),
    IncomeCategory(icon: 'assets/svg/sale.svg', title: 'Sales'),
  ];
}