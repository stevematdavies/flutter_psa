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
                final Transaction t = transactions[i];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child:  Padding(
                            padding: const EdgeInsets.all(10),
                            child: FittedBox(
                                child: Text("€${t.amount}"))),
                    ),
                    title: Text(t.title, style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(DateFormat('dd/MM/yyyy').format(t.date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
