import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/user_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Card(
              color: Colors.blue,
              child: SizedBox(
                width: double.infinity,
                child: Text("CHART!"),
              ),
            ),
            UserTransactions(),
          ],
        ));
  }
}
