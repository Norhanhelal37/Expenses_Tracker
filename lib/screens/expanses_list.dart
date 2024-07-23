import 'package:app/models/expanse.dart';
import 'package:app/screens/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({
    super.key,
    required this.expenses,
    required this.onremoveExpanse
  });
  final void Function(Expanse expanse) onremoveExpanse;

  final List<Expanse> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => 
      Dismissible(
        background: Container(
          margin: Theme.of(context).cardTheme.margin,
          color: Theme.of(context).colorScheme.error.withOpacity(.5),
          
          ),
        
        key : ValueKey(expenses[index] ),
        child: ExpansesItem(expense: expenses[index]),
        onDismissed: (direction) => onremoveExpanse(expenses[index])

        ,
        ),
    );
  }
}
