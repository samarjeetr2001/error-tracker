import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'errortracker_platform_interface.dart';

/// An implementation of [ErrortrackerPlatform] that uses method channels.
class MethodChannelErrortracker extends ErrortrackerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('errortracker');
}
