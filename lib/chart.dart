import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({ Key? key }) : super(key: key);
  final List<Transaction> _trnsaction;
  Chart(this._trnsaction);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _trnsaction.map((tx) {
        return Column(
          children: [
            Text(
              tx.amount.toString(),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 10,
              color: Colors.amber,
            ),
            SizedBox(height: 4),
            Text(
              DateFormat().add_E().format(tx.date),
            )
          ],
        );
      }).toList(),
    );
  }
}
