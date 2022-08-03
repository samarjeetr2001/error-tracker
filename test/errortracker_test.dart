import 'package:flutter_test/flutter_test.dart';
import 'package:errortracker/errortracker.dart';
import 'package:errortracker/errortracker_platform_interface.dart';
import 'package:errortracker/errortracker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockErrortrackerPlatform 
    with MockPlatformInterfaceMixin
    implements ErrortrackerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ErrortrackerPlatform initialPlatform = ErrortrackerPlatform.instance;

  test('$MethodChannelErrortracker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelErrortracker>());
  });

  test('getPlatformVersion', () async {
    Errortracker errortrackerPlugin = Errortracker();
    MockErrortrackerPlatform fakePlatform = MockErrortrackerPlatform();
    ErrortrackerPlatform.instance = fakePlatform;
  
    expect(await errortrackerPlugin.getPlatformVersion(), '42');
  });
}
