import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/models/expanse.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key, required this.onAddExpanse});
  final void Function(Expanse expanse) onAddExpanse;
  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.travel;

  double? eleva;

  double? eleva2;
  DateTime? _selsectedDate;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_selsectedDate == null
                          ? "No Date Selected"
                          : DateFormat.yMd().format(_selsectedDate!)),
                      IconButton(
                        onPressed: () async {
                          final init = DateTime.now();
        
                          DateTime? pickedTime = await showDatePicker(
                              context: context,
                              initialDate: init,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2300, 12, 31));
        
                          setState(() {
                            _selsectedDate = pickedTime;
                          });
                        },
                        icon: const Icon(Icons.calendar_month),
                      )
                    ],
                  ))
                ],
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (ele) => DropdownMenuItem(
                              child: Text(ele.name.toUpperCase()),
                              value: ele,
                            ),
                          )
                          .toList(),
                      onChanged: (newValue) {
                        if (newValue == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      }),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      onHover: (value) {
                        if (value) {
                          setState(() {
                            eleva = 90;
                          });
                        } else {
                          setState(() {
                            eleva = 0;
                          });
                        }
                      },
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(eleva),
                        overlayColor: const WidgetStatePropertyAll(Colors.amber),
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 193, 234, 240)),
                      ),
                      child: const Text("cancele")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final double? enteredAmount =
                          double.tryParse(_amountController.text);
                      final bool validAmount =
                          enteredAmount == null || enteredAmount <= 0;
        
                      if (_titleController.text.trim().isEmpty ||
                          validAmount ||
                          _selsectedDate == null) {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text("Invalid Input"),
                                  content: Text("Please try again!"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: Text("Oky"))
                                  ],
                                ));
                      } else {
                        widget.onAddExpanse(Expanse(
                            category: _selectedCategory,
                            title: _titleController.text,
                            amount: enteredAmount,
                            date: _selsectedDate!));
        
                        Navigator.pop(context);
                      }
                    },
                    onHover: (value) {
                      if (value) {
                        setState(() {
                          eleva2 = 20;
                        });
                      } else {
                        setState(() {
                          eleva2 = 0;
                        });
                      }
                    },
                    style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(eleva2),
                      overlayColor: const WidgetStatePropertyAll(Colors.amber),
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 193, 234, 240)),
                    ),
                    child: const Text("Save Expanse"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
