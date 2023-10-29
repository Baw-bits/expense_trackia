import 'package:expense_trackia/bar%20graph/my_bar_graph.dart';
import 'package:expense_trackia/data/expense_data.dart';
import 'package:expense_trackia/date_time.dart/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });
  double calculateMax(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    double? max = 100;

    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    values.sort();

    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 6)));
    return Consumer<ExpenseData>(
      builder: ((context, value, child) => Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(children: [
                    const Text(
                      'Week Total:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        ' \NGN${calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}'),
                  ])),
              SizedBox(
                  height: 200,
                  child: MyBarGraph(
                    friAmount:
                        value.calculateDailyExpenseSummary()[friday] ?? 0,
                    satAmount:
                        value.calculateDailyExpenseSummary()[saturday] ?? 0,
                    tueAmount:
                        value.calculateDailyExpenseSummary()[tuesday] ?? 0,
                    monAmount:
                        value.calculateDailyExpenseSummary()[monday] ?? 0,
                    thurAmount:
                        value.calculateDailyExpenseSummary()[thursday] ?? 0,
                    wedAmount:
                        value.calculateDailyExpenseSummary()[wednesday] ?? 0,
                    maxY: calculateMax(value, sunday, monday, tuesday,
                        wednesday, thursday, friday, saturday),
                    sunAmount:
                        value.calculateDailyExpenseSummary()[sunday] ?? 0,
                  )),
            ],
          )),
    );
  }
}
