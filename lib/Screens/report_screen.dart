import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Database/boxes.dart';
import '../Modals/money_model.dart';
import '../Widgets/linear_progress_indicator.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});
  final colorList = <Color>[
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ValueListenableBuilder<Box<MoneyModel>>(
        valueListenable: Boxes.getRecords().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<MoneyModel>();
          int totalIncome = 0;
          int totalExpense = 0;
          int total = 0;
          // double incomeProgress = totalIncome / total;
          for (int i = 0; i < data.length; i++) {
            if (data[i].amountType == true) {
              totalIncome = totalIncome + data[i].amount;
            } else {
              totalExpense = totalExpense + data[i].amount;
            }
            total = totalIncome + totalExpense;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 320,
                  child: PieChart(
                    centerWidget: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: MediaQuery.of(context).size.width / 4.8,
                      child: FittedBox(
                        child: Text(
                          total.toString(),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                    dataMap: {
                      totalIncome.toString():
                          double.parse(totalIncome.toString()),
                      totalExpense.toString():
                          double.parse(totalExpense.toString()),
                    },
                    animationDuration: const Duration(milliseconds: 1200),
                    chartLegendSpacing: 40,
                    chartRadius: MediaQuery.of(context).size.width / 1.91,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 24,
                    legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.left,
                      showLegends: false,
                      legendTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff91919F)),
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: true,
                      decimalPlaces: 1,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xff00A86B),
                  ),
                  title: Text(
                    'Income',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: FittedBox(
                    child: Text(
                      totalIncome.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          color: const Color(0xff00A86B),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                MyLinearProgressBar(
                  valueColor: const Color(0xff00A86B),
                  obtainedValue: totalIncome.toDouble(),
                  totalValue: total.toDouble(),
                  // totalTasks: _taskController.taskList.length.toDouble(),
                  // completedTasks: _taskController.ct.toDouble(),
                ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xffFD3C4A),
                  ),
                  title: Text(
                    'Expense',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    totalExpense.toString(),
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        color: const Color(0xffFD3C4A),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                MyLinearProgressBar(
                  valueColor: const Color(0xffFD3C4A),
                  obtainedValue: totalExpense.toDouble(),
                  totalValue: total.toDouble(),
                  // totalTasks: _taskController.taskList.length.toDouble(),
                  // completedTasks: _taskController.ct.toDouble(),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
