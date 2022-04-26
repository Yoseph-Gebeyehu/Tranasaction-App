import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/chart.dart';
import '/transaction_list.dart';
import 'new_transaction.dart';
import 'transaction.dart';

void main() => runApp(AppHomePage());

class AppHomePage extends StatelessWidget {
  // const AppHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'QuickSand',
            ),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 20,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 18,
            color: Colors.blue,
          ),
          button: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 18,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Transaction App',
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  // const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Transaction> _transaction = [
    // Transaction(title: 'Car', amount: 34, id: '1', date: DateTime.now()),
  ];

  void addTransaction(titleTx, amountTx, dateTx) {
    final addTx = Transaction(
      title: titleTx,
      amount: amountTx,
      id: DateTime.now().toString(),
      date: dateTx,
    );
    setState(() {
      _transaction.add(addTx);
    });
  }

  void startAddingNewTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              startAddingNewTransaction();
            },
            icon: Icon(Icons.add),
          ),
        ],
        title: Center(
          child: Text(
            'Personal Expenses',
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              child: Chart(_transaction),
            ),
            TransactionList(_transaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          startAddingNewTransaction();
        },
      ),
    );
  }
}
