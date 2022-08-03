import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calculator_repository.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? _num1;
  int? _num2;
  num? _result;
  String? _opt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Single digit calculator',
          style: TextStyle(color: Colors.grey.shade900),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.33,
            padding: const EdgeInsets.only(right: 32, bottom: 16),
            // color: Colors.white70
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${_num1 ?? ''} ${_opt ?? ''} ${_num2 ?? ''}',
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: _result != null ? 24 : 32)),
                if (_result != null)
                  Text('$_result',
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 32)),
              ],
            ),
          ),
          const Spacer(),
          Wrap(
            children: [
              button(() => addData('1'), '1'),
              button(() => addData('2'), '2'),
              button(() => addData('3'), '3'),
              button(() => addData('*'), '*'),
              button(() => addData('4'), '4'),
              button(() => addData('5'), '5'),
              button(() => addData('6'), '6'),
              button(() => addData('/'), '/'),
              button(() => addData('7'), '7'),
              button(() => addData('8'), '8'),
              button(() => addData('9'), '9'),
              button(() => addData('-'), '-'),
              button(() {
                setState(() {
                  _num1 = null;
                  _num2 = null;
                  _result = null;
                  _opt = null;
                });
              }, 'AC'),
              button(() => addData('0'), '0'),
              button(
                () {
                  if (_num1 != null && _num2 != null && _opt != null) {
                    CalculatorRepository.calculate(
                            num1: _num1!, num2: _num2!, opt: _opt!)
                        .then((value) {
                      setState(() {
                        _result = value;
                      });
                    });
                  } else {
                    Get.snackbar('Alert', 'Expression in not complete');
                  }
                },
                '=',
                color: Colors.amber.shade100,
              ),
              button(() => addData('+'), '+'),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Padding button(Function()? onTap, String text, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 80,
          height: 80,
          decoration: boxDecoration(color: color),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration({Color? color}) {
    return BoxDecoration(
      color: color ?? Colors.white70,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(2, 2),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );
  }

  bool isNumber(String text) {
    return '0123456789'.split('').contains(text);
  }

  bool isOperator(String text) {
    return '+-*/'.split('').contains(text);
  }

  void addData(String value) {
    if (_num1 == null) {
      if (isNumber(value)) {
        setState(() {
          _num1 = int.parse(value);
        });
      } else {
        Get.snackbar('Alert', 'Please enter a number');
      }
    } else if (_opt == null) {
      if (isOperator(value)) {
        setState(() {
          _opt = value;
        });
      } else {
        Get.snackbar('Alert', 'Please enter an operator');
      }
    } else if (_num2 == null) {
      if (isNumber(value)) {
        setState(() {
          _num2 = int.parse(value);
        });
      } else {
        Get.snackbar('Alert', 'Please enter a number');
      }
    } else {
      Get.snackbar('Alert', 'Click on = to calculate');
    }
  }
}
