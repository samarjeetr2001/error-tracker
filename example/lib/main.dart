import 'package:flutter/material.dart';

import 'package:errortracker/errortracker.dart';
import 'package:get/get.dart';

import 'calculator_view.dart';

void main() {
  Errortracker.initialize(
    () => runApp(const MyApp()),
    url: 'https://example.com/error',
    onError: (error, stackTrace) {
      dynamic errorMessage = error;
      Get.snackbar('Unhandeled Exception', '${errorMessage.message}' '',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Calculator(),
    );
  }
}
