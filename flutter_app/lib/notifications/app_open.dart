import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_app/notifications/config.dart';

Future<void> pushNotification(String message) async {
  // Android-specific notification details
  const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your_channel_id', // Channel ID
    'Your Channel Name', // Channel name
    channelDescription: 'Channel description',
    importance: Importance.high,
    priority: Priority.high,
    showWhen: false,
    icon: '@mipmap/ic_launcher'
  );

  // Notification details for other platforms
  const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

  // Display the notification
  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'App Usage Detected', // Notification title
    message, // Notification body
    platformChannelSpecifics,
  );
}
