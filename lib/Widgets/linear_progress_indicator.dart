import 'package:flutter/material.dart';

class MyLinearProgressBar extends StatelessWidget {
  final double totalValue;
  final double obtainedValue;
  final Color valueColor;

  const MyLinearProgressBar(
      {super.key, required this.totalValue, required this.obtainedValue,required this.valueColor});

  @override
  Widget build(BuildContext context) {
    double progress = obtainedValue / totalValue;

    return LinearProgressIndicator(
      value: progress,
      minHeight: 12,
      borderRadius: BorderRadius.circular(12),
      backgroundColor: const Color(0xffF1F1FA),
      valueColor: AlwaysStoppedAnimation<Color>(valueColor),
    );
  }
}
