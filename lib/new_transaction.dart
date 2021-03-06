import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({ Key? key }) : super(key: key);
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime date;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime.now(),
    ).then((_pickedValue) {
      if (_pickedValue == null) {
        return;
      }
      setState(() {
        date = _pickedValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 7,
        child: Container(
          padding:  EdgeInsets.only(
              // top: 10,
              // right: 10,
              // left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name of goods',
                ),
                style: Theme.of(context).textTheme.headline2,
                controller: titleController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount of money spent in \$',
                ),
                style: Theme.of(context).textTheme.headline2,
                controller: amountController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  date == null
                      ? Text(
                          'No date is choosen!',
                          style: Theme.of(context).textTheme.headline4,
                        )
                      : Text(
                          'You chose: ' + DateFormat().add_yMMMd().format(date),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                  TextButton(
                    onPressed: () => _showDatePicker(),
                    child: Text(
                      'Choose Date',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  widget.addTx(
                    titleController.text,
                    double.parse(amountController.text),
                    date,
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  'Add Transaction',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
