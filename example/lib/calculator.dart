import 'package:flutter/services.dart';

class CalculatorRepository {
  static const platform = MethodChannel('calculator');

  static void calculate() async {
    final result = await platform.invokeMethod("calculate", {
      "num1": 2,
      "num2": 0,
      "opt": '/',
    });
    print('RESULT -> $result');
  }
}
