import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/transaction.dart';

class Chart extends StatefulWidget {
  // const Chart({ Key? key }) : super(key: key);
  final List<Transaction> _recentTransaction;
  Chart(this._recentTransaction);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get getList {
    return List.generate(7, (index) {
      DateTime dayOfWeek = DateTime.now().subtract(Duration(days: index));
      double amount = 0;
      for (int i = 0; i < widget._recentTransaction.length; i++) {
        if (widget._recentTransaction[i].date.day == dayOfWeek.day &&
            widget._recentTransaction[i].date.month == dayOfWeek.month &&
            widget._recentTransaction[i].date.year == dayOfWeek.year) {
          setState(() {
            amount += widget._recentTransaction[i].amount;
          });
        }
      }
      ;
      return {'day': DateFormat.E().format(dayOfWeek), 'amount': amount};
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: getList.map((tx) {
            return Column(
              children: [
                tx['amount'] == null
                    ? Container(
                        height: constraints.maxHeight * 0.2,
                        child: Text(
                          '\$${'0'}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    : Container(
                        height: constraints.maxHeight * 0.2,
                        child: Text(
                          '\$${tx['amount'].toString()}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                SizedBox(
                  height: constraints.maxHeight * 0.5,
                ),
                Container(
                  height: constraints.maxHeight * 0.2,
                  child: Text(
                    tx['day'].toString(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      );
    });
  }
}
