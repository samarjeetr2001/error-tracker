import 'package:flutter/services.dart';

class CalculatorRepository {
  static const platform = MethodChannel('calculator');

  static Future<num> calculate(
      {required int num1, required int num2, required String opt}) async {
    final result = await platform.invokeMethod("calculate", {
      "num1": num1,
      "num2": num2,
      "opt": opt,
    });
    return result;
  }
}
