import 'package:flutter/material.dart';
import '/transaction.dart';
import 'package:intl/intl.dart';
import 'homepage.dart';

class TransactionList extends StatefulWidget {
  // const TransactionList({ Key? key }) : super(key: key);
  final List<Transaction> _transaction;
  final Function deleteTx;
  const TransactionList(this._transaction, this.deleteTx);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget._transaction.isEmpty
        ? Homepage()
        : SingleChildScrollView(
            child: Column(
              children: widget._transaction.map((tx) {
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text(
                        '\$${tx.amount}',
                        style: Theme.of(context).textTheme.button,
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
                      onPressed: () {
                        widget.deleteTx(tx.id);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          );
  }
}
