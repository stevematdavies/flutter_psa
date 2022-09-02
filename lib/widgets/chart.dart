import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var amtSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        final Transaction t = recentTransactions[i];
        if (t.date.day == weekday.day &&
            t.date.month == weekday.month &&
            t.date.year == weekday.year) {
          amtSum += t.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': amtSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (acc, trx) {
      return acc + (trx['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues
                .map((t) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        t['day'].toString(),
                        (t['amount'] as double),
                        maxSpending == 0.0
                            ? 0.0
                            : (t['amount'] as double) / maxSpending)))
                .toList()),
      ),
    );
  }
}
