import 'package:flutter/foundation.dart';

class Transactio {
  final String id;
  final String title;
  final double amount;
  final DateTime spandingDate;

  Transactio({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.spandingDate,
  });
}
