import 'package:flutter/material.dart';
import '/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  // const TransactionList({ Key? key }) : super(key: key);
  final List<Transaction> _transaction;
  final Function deleteTx;
  TransactionList(this._transaction, this.deleteTx);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget._transaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Container(
                  // margin: EdgeInsets.only(bottom: 10, top: 10),
                  width: double.infinity,
                  height: constraints.maxHeight * 0.75,
                  child: Image.asset(
                    'assets/images/Transaction.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.2,
                  child: Text(
                    'No transaction is added yet.Please add by pressing + icon below.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            );
          })
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
