import 'package:expense_trackia/data/expense_data.dart';
import 'package:expense_trackia/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('expense_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ExpenseData(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ));
  }
}
