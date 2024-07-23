import 'package:app/models/expanse.dart';
import 'package:app/screens/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expanses});
  final List<Expanse> expanses;
  List<ExpanseBucket> get buckets {
    return [
      ExpanseBucket.forCategory(expanses, Category.food),
      ExpanseBucket.forCategory(expanses, Category.leisure),
      ExpanseBucket.forCategory(expanses, Category.travel),
      ExpanseBucket.forCategory(expanses, Category.work)
    ];
  }

  get maxTotalExpanse {
    double maxTotalExpanse = 0;
    for (var ele in buckets) {
      if (ele.totalExpanse > maxTotalExpanse) {
        maxTotalExpanse = ele.totalExpanse;
      }
    }
    return maxTotalExpanse;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ])),
      child: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final ele in buckets)
                ChartBar(
                  fill: ele.totalExpanse == 0
                      ? 0
                      : ele.totalExpanse / maxTotalExpanse!,
                )
            ],
          )),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: buckets
                .map((e) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Icon(
                          categoryIcon[e.category],
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
