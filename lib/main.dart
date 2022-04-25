import 'dart:ffi';

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
        title: Text(
          'Personal Expenses',
        ),
      ),
      body: Column(
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
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 20),
            width: double.infinity,
            height: 100,
            child: Card(
              child: Center(
                child: Text('Image'),
              ),
              elevation: 10,
            ),
          ),
          Text(
            'No transaction is added yet.Please add by pressing + icon below.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
