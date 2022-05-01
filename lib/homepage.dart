import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
      });
  }
}
