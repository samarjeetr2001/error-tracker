
import 'errortracker_platform_interface.dart';

class Errortracker {
  Future<String?> getPlatformVersion() {
    return ErrortrackerPlatform.instance.getPlatformVersion();
  }
}
