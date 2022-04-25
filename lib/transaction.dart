import 'package:flutter/cupertino.dart';

class Transaction {
  final String title;
  final double amount;
  final String id;
  final DateTime;

  Transaction({
    @required this.title,
    @required this.amount,
    @required this.id,
    @required this.DateTime,
  });
}
