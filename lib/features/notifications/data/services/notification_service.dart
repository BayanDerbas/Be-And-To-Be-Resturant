import 'dart:html' as html;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static String? fcm_Token;

  // ✅ مفتاح عام للوصول لـ ScaffoldMessenger من أي مكان
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
  GlobalKey<ScaffoldMessengerState>();

  Future<void> initNotifications() async {
    // Register service worker (for web)
    if (html.window.navigator.serviceWorker != null) {
      try {
        await html.window.navigator.serviceWorker!
            .register('firebase-messaging-sw.js');
        print('✅ Service Worker registered');
      } catch (e) {
        print('❌ Service Worker registration failed: $e');
      }
    }

    // Request permissions
    NotificationSettings settings = await _fcm.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      print('❌ User declined notifications');
      return;
    }

    // Get FCM token
    try {
      String? token = await _fcm.getToken(
        vapidKey:
        "BC0G6648G2h5E0PZ5C9UOGk2E5HlQOtWCqsVbUMWEuibu7CYht4x1mGpeJ3V6KH0nMusfhOoz6ebE4BJ0biJPQ8",
      );
      if (token != null) {
        fcm_Token = token;
        print("📱 FCM Token: $token");
      }
    } catch (e) {
      print('❌ Failed to get FCM token: $e');
    }

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'إشعار جديد';
      final body = message.notification?.body ?? '';

      print("📩 Foreground message: $title");

      // ✅ استخدم الـ messengerKey بدلاً من context
      final messenger = messengerKey.currentState;
      if (messenger != null) {
        messenger.showSnackBar(
          SnackBar(
            content: Text('✅ $title\n🔔 $body'),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        print('⚠️ No ScaffoldMessenger found (app not ready yet)');
      }

      // Optional: browser notification
      if (html.Notification.supported) {
        html.Notification(title, body: body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📬 Notification clicked: ${message.notification?.title}");
    });
  }
}


// class NotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   static String? fcm_Token;
//
//   Future<void> initNotifications() async {
//     // 1️⃣ Register Service Worker (required for background messages on web)
//     if (html.window.navigator.serviceWorker != null) {
//       try {
//         await html.window.navigator.serviceWorker!
//             .register('firebase-messaging-sw.js');
//         print('✅ Service Worker registered');
//       } catch (e) {
//         print('❌ Service Worker registration failed: $e');
//       }
//     }
//
//     // 2️⃣ Request Notification Permission
//     NotificationSettings settings = await _fcm.requestPermission();
//     print("🔔 Permission: ${settings.authorizationStatus}");
//
//     if (settings.authorizationStatus != AuthorizationStatus.authorized) {
//       print('❌ User declined notifications');
//       return;
//     }
//
//     // 3️⃣ Get FCM Token (with VAPID key)
//     try {
//       String? token = await _fcm.getToken(
//         vapidKey:
//         "BC0G6648G2h5E0PZ5C9UOGk2E5HlQOtWCqsVbUMWEuibu7CYht4x1mGpeJ3V6KH0nMusfhOoz6ebE4BJ0biJPQ8",
//       );
//       if (token != null) {
//         fcm_Token = token;
//         print("📱 FCM Token: $token");
//       }
//     } catch (e) {
//       print('❌ Failed to get FCM token: $e');
//     }
//
//     // 4️⃣ Listen to Foreground Messages
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   print("📩 رسالة جديدة (Foreground):");
//     //   print("Title: ${message.notification?.title}");
//     //   print("Body: ${message.notification?.body}");
//     //   print("Data: ${message.data}");
//     // });
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("📩 رسالة جديدة (Foreground): ${message.notification?.title}");
//
//       if (html.Notification.supported) {
//         html.Notification(
//           message.notification?.title ?? 'إشعار جديد',
//           body: message.notification?.body ?? '',
//         );
//       }
//     });
//
//     // 5️⃣ Listen to Messages when clicked from Notification
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("📬 Notification clicked:");
//       print("Title: ${message.notification?.title}");
//     });
//   }
// }
