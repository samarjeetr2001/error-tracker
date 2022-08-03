import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'errortracker_method_channel.dart';

abstract class ErrortrackerPlatform extends PlatformInterface {
  /// Constructs a ErrortrackerPlatform.
  ErrortrackerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ErrortrackerPlatform _instance = MethodChannelErrortracker();

  /// The default instance of [ErrortrackerPlatform] to use.
  ///
  /// Defaults to [MethodChannelErrortracker].
  static ErrortrackerPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ErrortrackerPlatform] when
  /// they register themselves.
  static set instance(ErrortrackerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
