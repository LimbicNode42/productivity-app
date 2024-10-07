// The callback function should always be a top-level function.
import 'package:flutter_app/permissions/barrel.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'package:flutter_app/notifications/app_open.dart';

@pragma('vm:entry-point')
void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}

class MyTaskHandler extends TaskHandler {
  // Called when the task is started.
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    print('onStart(starter: ${starter.name})');
  }

  // Called by eventAction in [ForegroundTaskOptions].
  // - nothing() : Not use onRepeatEvent callback.
  // - once() : Call onRepeatEvent only once.
  // - repeat(interval) : Call onRepeatEvent at milliseconds interval.
  @override
  void onRepeatEvent(DateTime timestamp) {
    // Send data to main isolate.
    final Map<String, dynamic> data = {
      "timestampMillis": timestamp.millisecondsSinceEpoch,
    };
    FlutterForegroundTask.sendDataToMain(data);
  }

  // Called when the task is destroyed.
  @override
  Future<void> onDestroy(DateTime timestamp) async {
    print('onDestroy');
  }

  // Called when data is sent using [FlutterForegroundTask.sendDataToTask].
  @override
  void onReceiveData(Object data) {
    print('onReceiveData: $data');
      
    // Display a notification
    _pushNotification(data.toString());
  }

  Future<void> _pushNotification(String message) async {
    await pushNotification(message);
  }

  // Called when the notification button is pressed.
  @override
  void onNotificationButtonPressed(String id) {
    print('onNotificationButtonPressed: $id');
  }

  // Called when the notification itself is pressed.
  //
  // AOS: "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted
  // for this function to be called.
  @override
  void onNotificationPressed() {
    FlutterForegroundTask.launchApp('/home');
    print('onNotificationPressed');
  }

  // Called when the notification itself is dismissed.
  //
  // AOS: only work Android 14+
  // iOS: only work iOS 10+
  @override
  void onNotificationDismissed() {
    print('onNotificationDismissed');
  }
}

// Callback function to handle incoming data
void onReceiveTaskData(Object? data) {
  if (data is Map<String, dynamic>) {
    // Extract the message from the data
    final String? eventMessage = data['event_message'] as String?;
    if (eventMessage != null) {
      // Handle the data received from the foreground service
      print('Received event from foreground service: $eventMessage');
    }
  }
}
// TODO: will need to add a check for permanently denied permission and add prompt to allow
// Once permanently denied requires user to open settings
Future<ServiceRequestResult> startForegroundService() async {
  if (await FlutterForegroundTask.isRunningService) {
    return FlutterForegroundTask.restartService();
  } else {
    return FlutterForegroundTask.startService(
      serviceId: 256,
      notificationTitle: 'Foreground Service is running',
      notificationText: 'Tap to return to the app',
      notificationIcon: null,
      notificationButtons: [
        const NotificationButton(id: 'btn_hello', text: 'hello'),
      ],
      callback: startCallback,
    );
  }
}

Future<ServiceRequestResult> stopForegroundService() async {
  if (await FlutterForegroundTask.isRunningService) {
    return FlutterForegroundTask.stopService();
  }
  return ServiceRequestResult.success();
}