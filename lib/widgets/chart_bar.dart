import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingOfTotal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text("€${spendingAmount.toStringAsFixed(0)}")),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: spendingOfTotal,
                  child: Container(
                      decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ))),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(label)
      ],
    );
  }
}
