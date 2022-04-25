import 'package:flutter/material.dart';
import '/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  // const TransactionList({ Key? key }) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transaction> _transaction = [
    // Transaction(title: 'Car', amount: 34, id: '1', date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return _transaction.isEmpty
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 10),
                width: double.infinity,
                height: 210,
                child: Image.asset(
                  'assets/images/Transaction.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'No transaction is added yet.Please add by pressing + icon below.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        : Column(
            children: _transaction.map((tx) {
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Text(
                      tx.amount.toString(),
                    ),
                  ),
                  title: Text(tx.title),
                  subtitle: Text(tx.date.toString()),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
              );
            }).toList(),
          );
  }
}
