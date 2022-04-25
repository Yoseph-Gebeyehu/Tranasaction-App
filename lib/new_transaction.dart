import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({ Key? key }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
          ),
          TextButton(
            onPressed: () {
              
            },
            child: Text('Choose date'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
