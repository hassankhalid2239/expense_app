import 'package:flutter/material.dart';

class MyLinearProgressBar extends StatelessWidget {
  final double totalValue;
  final double obtainedValue;
  final Color valueColor;

  const MyLinearProgressBar({
    super.key,
    required this.totalValue,
    required this.obtainedValue,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    // Checking for zero or negative totalValue
    double progress = (totalValue > 0) ? (obtainedValue / totalValue) : 0;

    return LinearProgressIndicator(
      value: progress,
      minHeight: 12,
      backgroundColor: const Color(0xffF1F1FA),
      borderRadius: BorderRadius.circular(12),
      valueColor: AlwaysStoppedAnimation<Color>(valueColor),
    );
  }
}
