import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index),);
      var amtSum = 0.0;
      for(var i = 0 ; i< recentTransactions.length; i++){
        final Transaction t = recentTransactions[i];
        if (t.date.day == weekday.day
            && t.date.month == weekday.month
            && t.date.year == weekday.year){
              amtSum += t.amount;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'amount' : amtSum };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

        ],
      )
    );
  }
}
