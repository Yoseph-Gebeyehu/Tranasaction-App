import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({ Key? key }) : super(key: key);
  final List<Transaction> _recentTransaction;
  Chart(this._recentTransaction);
  List<Map<String, Object>> get getList {
    return List.generate(7, (index) {
      DateTime dayOfWeek = DateTime.now().subtract(Duration(days: index));
      double amount;
      for (int i = 0; i < _recentTransaction.length; i++) {
        if (_recentTransaction[i].date.day == dayOfWeek.day &&
            _recentTransaction[i].date.month == dayOfWeek.month &&
            _recentTransaction[i].date.year == dayOfWeek.year) {
          amount = _recentTransaction[i].amount;
        }
      }
      ;
      return {'day': DateFormat.E().format(dayOfWeek), 'amount': amount};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getList.map((tx) {
          return Column(
            children: [
              Text(tx['amount'].toString()),
              SizedBox(
                height: 50,
              ),
              Text(tx['day'].toString()),
            ],
          );
        }).toList(),
      ),
    );
    
  }
}
