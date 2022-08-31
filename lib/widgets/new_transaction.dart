import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionCallback;

  final titleInputController = TextEditingController();
  final expenseInputController = TextEditingController();

  NewTransaction(this.addTransactionCallback, {Key? key}) : super(key: key);

  void _submitData() {
    final title = titleInputController.text;
    final amount = double.parse(expenseInputController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    addTransactionCallback(title,amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleInputController,
              onSubmitted: (_) => _submitData(),
              decoration: const InputDecoration(labelText: "Expense Title"),
            ),
            TextField(
              controller: expenseInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              decoration: const InputDecoration(labelText: "Expense Amount"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextButton(
                  onPressed: _submitData,
                  child: const Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.purple),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
