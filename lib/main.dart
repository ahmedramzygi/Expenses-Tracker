import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    String titleInput;
    String amountInput;
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (val)=>amountInput=val,
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (val)=>titleInput=val,
                    ),
                    ElevatedButton(onPressed: (){
                      print(amountInput);
                      print(titleInput);

                    }, child: Text("Add transaction"),style: ElevatedButton.styleFrom(
                      primary: Colors.purple
                    ))
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.purple),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
