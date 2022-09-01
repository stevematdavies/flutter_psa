import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              Text("No transactions added yet!",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  height: 200,
                  child: Image.asset('resources/images/waiting.png', fit: BoxFit.cover)
              ),
            ])
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return Card(
                  elevation: 2,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "€${transactions[i].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  transactions[i].title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            Text(
                                DateFormat('d MMM yyyy')
                                    .format(transactions[i].date),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                )),
                          ])
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
