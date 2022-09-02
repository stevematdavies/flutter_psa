import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: <Widget>[
              Text("No transactions added yet!",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('resources/images/waiting.png',
                      fit: BoxFit.cover)),
            ]);
          })
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
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(child: Text("€${t.amount}"))),
                    ),
                    title: Text(t.title,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(DateFormat('dd/MM/yyyy').format(t.date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () => deleteTransaction(t.id),
                            icon: const Icon(Icons.delete),
                            label: Text(
                              "Delete",
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            ))
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTransaction(t.id))),
              );
            },
            itemCount: transactions.length,
          );
  }
}
