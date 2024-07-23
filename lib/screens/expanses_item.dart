import 'package:app/models/expanse.dart';
import 'package:flutter/material.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem({super.key,required this.expense});
  final Expanse expense;

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: Theme.of(context).textTheme.titleLarge),
            Row(
              children: [
                Text("\$${expense.amount.toString()}",),

               const Spacer(),

                Row(
                 children: [
                  Icon(categoryIcon[expense.category]),
                 const SizedBox(width: 10,)
                 , Text("${expense.formatedDate()}"),
              ],
            )
              ],
            ),
           
          ],
        ),
      ),

    );
  }
}
