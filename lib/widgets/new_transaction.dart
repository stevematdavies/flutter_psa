import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionCallback;

  const NewTransaction(this.addTransactionCallback, {Key? key})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInputController = TextEditingController();
  final _expenseInputController = TextEditingController();
  DateTime ?_selectedDateOfTransaction;

  void _submitData() {
    final title = _titleInputController.text;
    final amount = double.parse(_expenseInputController.text);
    if (title.isEmpty || amount <= 0 || _selectedDateOfTransaction == null) {
      return;
    }
    widget.addTransactionCallback(title, amount, _selectedDateOfTransaction);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((d) {
      if (d == null) {
        return;
      }
      setState(() {
        _selectedDateOfTransaction = d;
      });
    });
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
              controller: _titleInputController,
              onSubmitted: (_) => _submitData(),
              decoration: const InputDecoration(labelText: "Expense Title"),
            ),
            TextField(
              controller: _expenseInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              decoration: const InputDecoration(labelText: "Expense Amount"),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDateOfTransaction == null
                        ? "No date chosen"
                        : DateFormat('dd/MM/yyyy')
                            .format(_selectedDateOfTransaction!)),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    child: const Text("Choose Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                  onPressed: _submitData,
                  child: const Text("Add Transaction")),
            )
          ],
        ),
      ),
    );
  }
}
