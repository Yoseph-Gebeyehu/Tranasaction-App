import 'package:flutter/material.dart';
import '/chart.dart';
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
          headline1: const TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 20,
            color: Colors.black,
          ),
          headline2: const TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 18,
            color: Colors.blue,
          ),
          button: const TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 18,
            color: Colors.white,
          ),
          headline4: const TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 16,
            color: Colors.black,
          ),
          headline5: const TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 16,
            color: Colors.blue,
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
  List<Transaction> _transaction = [];

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

  void deleteTx(String id) {
    setState(() {
      _transaction.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final AppBar appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () {
            startAddingNewTransaction();
          },
          icon: const Icon(Icons.add),
        ),
      ],
      title: Center(
        child: Text(
          'Personal Expenses',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
    );
    final appBarHeight = appBar.preferredSize.height;
    final portraitView = Column(
      children: [
        Container(
          height: (mediaQueryHeight -
                  appBarHeight -
                  MediaQuery.of(context).padding.top) *
              0.2,
          // width: double.infinity,
          child: Chart(_transaction),
        ),
        Container(
          height: (mediaQueryHeight -
                  appBarHeight -
                  MediaQuery.of(context).padding.top) *
              0.7,
          child: TransactionList(_transaction, deleteTx),
        ),
      ],
    );
    final landscapeView = Column(
      children: [
        Container(
          height: (mediaQueryHeight -
                  appBarHeight -
                  MediaQuery.of(context).padding.top) *
              0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Show chart',
                style: Theme.of(context).textTheme.headline2,
              ),
              Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  }),
            ],
          ),
        ),
        _showChart
            ? Container(
                height: (mediaQueryHeight -
                        appBarHeight -
                        MediaQuery.of(context).padding.top) *
                    0.5,
                width: double.infinity,
                child: Chart(_transaction),
              )
            : Container(
                height: (mediaQueryHeight -
                        appBarHeight -
                        MediaQuery.of(context).padding.top) *
                    0.8,
                child: TransactionList(_transaction, deleteTx),
              ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (landscape) landscapeView,
            if (portrait) portraitView,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const IconButton(
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
