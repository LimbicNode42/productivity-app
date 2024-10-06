import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: _onStart, // Register the callback function
      isForegroundMode: true, // Ensure the service runs in the foreground
      autoStart: true, // Automatically start service on boot
      autoStartOnBoot: true,
      foregroundServiceTypes: [AndroidForegroundType.dataSync]
    ),
    iosConfiguration: IosConfiguration(
      onForeground: _onStart,
      autoStart: true,
      onBackground: null,
    ),
  );

  await service.startService();
}

@pragma('vm:entry-point')
void _onStart(ServiceInstance service) {
  // Check if the service is running in the foreground on Android
  if (service is AndroidServiceInstance) {
    service.setForegroundNotificationInfo(
      title: "Monitoring App Usage",
      content: "Service is running in the background...",
    );
  }

  // Periodically monitor the usage stats
  Timer.periodic(Duration(seconds: 5), (timer) async {
    // Add your logic for fetching usage stats here
    String? packageName = await _getForegroundApp();
    if (packageName != null) {
      print("Currently running app: $packageName");
    }
  });
}

@pragma('vm:entry-point')
Future<String?> _getForegroundApp() async {
  const platform = MethodChannel('com.example/android_native');

  try {
    final String? package = await platform.invokeMethod('getForegroundApp');
    return package;
  } on PlatformException catch (e) {
    print("Failed to check permission status: ${e.message}");
    return "You nonce";
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("App Usage Monitoring")),
        body: Center(child: Text("Monitoring app usage in the background.")),
      ),
    );
  }
}
