import 'package:flutter/material.dart';
import '/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  // const TransactionList({ Key? key }) : super(key: key);
  final List<Transaction> _transaction;
  TransactionList(this._transaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget._transaction.isEmpty
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
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
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          )
        : Column(
            children: widget._transaction.map((tx) {
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Text(
                      '\$${tx.amount}',
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(tx.date).toString(),
                  ),
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
