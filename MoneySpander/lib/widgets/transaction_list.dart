import 'package:MoneySpander/models/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transation added yet!',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\€ ${_transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      '${_transactions[index].title}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(DateFormat('dd/MMM/yyyy')
                        .format(_transactions[index].spandingDate)),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            _deleteTransaction(_transactions[index].id)),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
