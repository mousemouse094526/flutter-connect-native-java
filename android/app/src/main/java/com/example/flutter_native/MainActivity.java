package com.example.flutter_native;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example/native_bridge";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    if (call.method.equals("getNativeData")) {
                        String nativeData = getNativeData();
                        result.success(nativeData);
                    } else {
                        result.notImplemented();
                    }
                });
    }

    private String getNativeData() {
        return "Hello from Native";
    }
}
