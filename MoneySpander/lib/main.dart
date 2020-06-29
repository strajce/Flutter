import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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
  final List<Transactio> transaction = [
    Transactio(
        id: "0", title: "New PS4", amount: 220, spandingDate: DateTime.now()),
    Transactio(
        id: "1",
        title: "Spiderman GOTY",
        amount: 18,
        spandingDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Card Chart"),
              color: Colors.yellow,
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.green,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              child: Column(
                children: transaction.map((tx) {
                  return Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          '\€: ${tx.amount}',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(tx.spandingDate),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
