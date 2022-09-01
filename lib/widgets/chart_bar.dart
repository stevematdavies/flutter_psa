import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingOfTotal;

  const ChartBar(
      this.label,
      this.spendingAmount,
      this.spendingOfTotal,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
