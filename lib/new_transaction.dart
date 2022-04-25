import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              date == null
                  ? Text('No date is choosen!')
                  : Text(
                      'You chose: ' + DateFormat().add_yMMMd().format(date),
                    ),
              TextButton(
                onPressed: () => _showDatePicker(),
                child: Text('Choose Date'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              widget.addTx(titleController.text,
                  double.parse(amountController.text), date);
            },
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
