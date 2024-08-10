import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
        child: SizedBox(
          height: 185,
          child: PieChart(
            dataMap: {
              "Income": 2500,
              "Expenses": 1500,
            },
            animationDuration: const Duration(milliseconds: 1200),
            chartLegendSpacing: 40,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 25,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.left,
              showLegends: true,
              legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff91919F)),
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
      ),
    );
  }
}
