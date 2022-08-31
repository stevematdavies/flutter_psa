import 'package:flutter/material.dart';
import 'package:personal_expenses_app/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Card(
              color: Colors.blue,
              child: SizedBox(
                width: double.infinity,
                child: Text("CHART!"),
              ),
            ),
            Column(
              children: transactions
                  .map((Transaction tx) => Card(
                        elevation: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.purpleAccent,
                                  border: Border.all(
                                      color: Colors.purple, width: 2)),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  "€${tx.amount}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white)),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: Text(tx.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:Colors.purple,
                                          fontSize: 16,
                                        )),
                                  ),
                                  Text(
                                      tx.date.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      )),
                                ])
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
