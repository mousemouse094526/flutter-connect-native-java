import 'package:flutter/services.dart';

class NativeBridge {
  static const platform = MethodChannel('com.example/native_bridge');

  Future<String> getNativeData() async {
    try {
      final String result = await platform.invokeMethod('getNativeData');
      return result;
    } on PlatformException catch (e) {
      return "Failed to get data: '${e.message}'.";
    }
  }
}
