// TODO: need to handle this better to be able to publish
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io';

Future<bool> checkUsageStatsPermission() async {
  final deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;

    // Check if SDK version is 23 or higher
    if (androidInfo.version.sdkInt >= 21) {
      // Check if permission is already granted
      bool isGranted = await _checkNativePermissionStatus();
      return isGranted;
    } else {
      print("Android version not current enough");
    }
  }

  return false;
}

Future<bool> _checkNativePermissionStatus() async {
  const platform = MethodChannel('com.example/android_native');

  try {
    final bool isGranted = await platform.invokeMethod('checkUsageStatsPermission');
    return isGranted;
  } on PlatformException catch (e) {
    print("Failed to check permission status: ${e.message}");
    return false;
  }
}


// Function to prompt user to enable usage stats permission
Future<void> _requestUsageStatsPermission() async {
  final intent = AndroidIntent(
    action: 'android.settings.USAGE_ACCESS_SETTINGS',
  );
  intent.launch();
}

// Function to show a custom dialog before opening settings
void showUsageAccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Permission Required'),
      content: Text(
        'To track app usage, we need access to your usage data. Please enable usage access for this app in the next screen.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Dismiss dialog
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss dialog
            _requestUsageStatsPermission(); // Open settings
          },
          child: Text('Open Settings'),
        ),
      ],
    ),
  );
}
