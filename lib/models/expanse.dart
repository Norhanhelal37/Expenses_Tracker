import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import "package:intl/intl.dart";

const uuid = Uuid();
final dateTime = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expanse {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String formatedDate() {
    return dateTime.format(date);
  }

  Expanse({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();
}

class ExpanseBucket {
  final Category category;
  final List<Expanse> expences;

  ExpanseBucket(this.category, this.expences);

  ExpanseBucket.forCategory(List<Expanse> allExpanses,this.category, ):
     expences = allExpanses.where((ele)=> ele.category == category).toList();

  double get totalExpanse {
    double sum = 0;
    for (var expen in expences) {
      sum += expen.amount;
    }

    return sum;
  }
}
