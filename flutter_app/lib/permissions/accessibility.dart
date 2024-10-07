// TODO: need to handle this better to be able to publish
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io';

import 'package:flutter_app/singletons/android.dart';

Future<bool> checkAccessibilityPermission() async {
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
  try {
    final bool isGranted = await androidChannel.invokeMethod('checkAccessibilityPermission');
    return isGranted;
  } on PlatformException catch (e) {
    print("Failed to check permission status: ${e.message}");
    return false;
  }
}


// Function to prompt user to enable accessibility permission
Future<void> _requestAccessibilityPermission() async {
  try {
    await androidChannel.invokeMethod('openAccessibilitySettings');
  } catch (e) {
    print("Failed accessibility intent");
  }
}

// Function to show a custom dialog before opening settings
void showAccessibilityDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Accessibility Permission Required'),
      content: Text(
        'To track app usage, we need access to your accessibility settings. Please enable accessibility access for this app in the next screen.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Dismiss dialog
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss dialog
            _requestAccessibilityPermission(); // Open settings
          },
          child: Text('Open Settings'),
        ),
      ],
    ),
  );
}
