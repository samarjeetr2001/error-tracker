import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:errortracker/errortracker.dart';

import 'calculator.dart';

void main() {
  Errortracker.initialize(
    () => runApp(const MyApp()),
    url: 'https://example.com/error',
    onError: (error, stackTrace) {
      log('Unhandled exception',
          name: 'Errortracker', error: error, stackTrace: stackTrace);
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Running on: Android\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            CalculatorRepository.calculate();
          },
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}
