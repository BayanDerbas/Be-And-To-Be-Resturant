import 'dart:html' as html;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // 1️⃣ Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // 2️⃣ Register Service Worker (for web push)
    if (html.window.navigator.serviceWorker != null) {
      try {
        await html.window.navigator.serviceWorker!
            .register('firebase-messaging-sw.js');
        print('✅ Service Worker registered');
      } catch (e) {
        print('❌ Service Worker registration failed: $e');
      }
    }

    // 3️⃣ Anonymous Sign-in (required for FCM on web)
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print('✅ Signed in anonymously');
    } catch (e) {
      print('❌ Anonymous sign-in failed: $e');
      return;
    }

    // 4️⃣ Request notification permission
    NotificationSettings settings = await _fcm.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      print('❌ User declined notifications');
      return;
    }

    // 5️⃣ Get FCM token
    try {
      String? token = await _fcm.getToken(
        vapidKey:
        "BC0G6648G2h5E0PZ5C9UOGk2E5HlQOtWCqsVbUMWEuibu7CYht4x1mGpeJ3V6KH0nMusfhOoz6ebE4BJ0biJPQ8",
      );
      print("📱 FCM Token: $token");
    } catch (e) {
      print('❌ Failed to get FCM token: $e');
    }

    // 6️⃣ Listen to foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 New message: ${message.notification?.title ?? 'No Title'}");
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print("📩 رسالة جديدة:");
    //   print("Title: ${message.notification?.title}");
    //   print("Body: ${message.notification?.body}");
    //   print("Data: ${message.data}");
    // });


    // 7️⃣ Optional: Listen to messages opened from notification click
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📬 Message clicked: ${message.notification?.title ?? 'No Title'}");
    });
  }
}
