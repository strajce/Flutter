import './chart_bar.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransaction;

  Chart(this._recentTransaction);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;

      for (var i = 0; i < _recentTransaction.length; i++) {
        if (_recentTransaction[i].spandingDate.day == weekDay.day &&
            _recentTransaction[i].spandingDate.month == weekDay.month &&
            _recentTransaction[i].spandingDate.year == weekDay.year) {
          totalSum += _recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpanding {
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum += item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactionValue.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      totalSpanding == 0
                          ? 0.0
                          : (data['amount'] as double) / totalSpanding),
                );
              }).toList(),),
        ));
  }
}
