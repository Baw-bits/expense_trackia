import 'package:expense_trackia/bar%20graph/individual_bar.dart';

class Bardata {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  Bardata(
      {required this.friAmount,
      required this.wedAmount,
      required this.tueAmount,
      required this.monAmount,
      required this.satAmount,
      required this.thurAmount,
      required this.sunAmount});

  List<IndividualBar> barData = [];

  void initializedBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmount),
      IndividualBar(x: 1, y: monAmount),
      IndividualBar(x: 2, y: tueAmount),
      IndividualBar(x: 3, y: wedAmount),
      IndividualBar(x: 4, y: thurAmount),
      IndividualBar(x: 5, y: friAmount),
      IndividualBar(x: 6, y: satAmount)
    ];
  }
}
