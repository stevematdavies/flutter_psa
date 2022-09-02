import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          fontFamily: "Quicksand",
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.amber),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  bool _isChartShown = false;

  void _addNewTransaction(String txTitle, double txAmt, DateTime txDate) {
    setState(() {
      _userTransactions.add(Transaction(
          id: "${DateTime.now().millisecond}_${_userTransactions.length + 1}",
          title: txTitle,
          amount: txAmt,
          date: txDate));
    });
  }

  void _deleteTransaction(String txId) {
    setState(() {
      _userTransactions.removeWhere((t) => t.id == txId);
    });
  }

  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(_addNewTransaction),
      ),
    );
  }

  List<Transaction> get _recentTransactions {
    return List.from(_userTransactions.where((Transaction t) =>
        t.date.isAfter(DateTime.now().subtract(const Duration(days: 7)))));
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () => _showAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
      title: const Text('Personal Expenses'),
    );
    final txList = SizedBox(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionList(_userTransactions, _deleteTransaction));

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Show Chart"),
                  Switch(
                    value: _isChartShown,
                    onChanged: (v) {
                      setState(() {
                        _isChartShown = v;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: Chart(_recentTransactions)),
            if (!isLandscape) txList,
            if (isLandscape)
              _isChartShown
                  ? SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_recentTransactions))
                  : txList
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddNewTransaction(context),
      ),
    );
  }
}
