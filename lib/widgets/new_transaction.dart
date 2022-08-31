import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);

  final titleInputController = TextEditingController();
  final expenseInputController = TextEditingController();

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
              decoration: const InputDecoration(labelText: "Expense Title"),
            ),
            TextField(
              controller: expenseInputController,
              decoration: const InputDecoration(labelText: "Expense Amount"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: OutlinedButton(
                  onPressed: () {
                    print(titleInputController.text);
                    print(expenseInputController.text);
                  },
                  child: const Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.indigo),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
