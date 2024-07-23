import 'package:app/models/expanse.dart';
import 'package:app/screens/chart/chart.dart';
import 'package:app/screens/expanses_list.dart';
import 'package:app/screens/new_expanse.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expanse> _registeredExpenses = [
    Expanse(
        category: Category.work,
        title: "Flutter Course",
        amount: 29.9,
        date: DateTime.now()),
    Expanse(
        category: Category.leisure,
        title: "Cinema",
        amount: 9.71,
        date: DateTime.now()),
    Expanse(
        category: Category.food,
        title: "Breakfast",
        amount: 31.3,
        date: DateTime.now()),
  ];

  void _addExpanse(Expanse expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpanse(Expanse expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanse Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (c) => NewExpanse(
                          onAddExpanse: _addExpanse,
                        ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: width < 600
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chart(
                    expanses: _registeredExpenses,
                  ),
                  Expanded(
                      child: ExpansesList(
                    expenses: _registeredExpenses,
                    onremoveExpanse: _removeExpanse,
                  ))
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Chart(
                      expanses: _registeredExpenses,
                    ),
                  ),
                  Expanded(
                      child: ExpansesList(
                    expenses: _registeredExpenses,
                    onremoveExpanse: _removeExpanse,
                  ))
                ],
              ),
      ),
    );
  }
}
