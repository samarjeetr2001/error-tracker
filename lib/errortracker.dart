import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

class Errortracker {
  static late final Dio _client;
  static Errortracker? _instance;
  Errortracker._();

  /// This will initialize the error tracker.
  static void initialize(void Function() callback,
      {required String url, Function(Object, StackTrace)? onError}) {
    if (_instance == null) {
      _instance = Errortracker._();
      _client = Dio();
      runZonedGuarded(
        callback,
        (error, stackTrace) async {
          log(
            'Unhandled Exception',
            name: 'Errortracker',
            error: error,
            stackTrace: stackTrace,
          );
          _logError(error: error, stackTrace: stackTrace, url: url);
          onError?.call(error, stackTrace);
        },
      );
    }
  }

  static void _logError({
    required Object error,
    required StackTrace stackTrace,
    required String url,
  }) async {
    // dummy api call to log the error
    await _client.post(
      'https://reqres.in/api/users',
      data: {
        'name': error.toString(),
        'job': stackTrace.toString(),
      },
    );
  }
}
