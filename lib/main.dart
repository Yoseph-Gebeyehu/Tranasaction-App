import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction_list.dart';
import 'new_transaction.dart';

void main() => runApp(AppHomePage());

class AppHomePage extends StatelessWidget {
  // const AppHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  void startAddingNewTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction();
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
        title: Text(
          'Personal Expenses',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Center(
                  child: Text(
                    'Expenses Chart',
                  ),
                ),
              ),
            ),
            TransactionList()
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
