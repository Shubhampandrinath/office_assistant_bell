import 'dart:convert';
import 'package:bellnotification1/feature/home_page/controller/home_page-controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  @pragma('vm:entry-point')
  Future<void> backgroundHandler(RemoteMessage message) async {
    // print("Handling a background message: ${message.messageId}");
    // print("Fcm--> title ${message.notification?.title}");
    // print("Fcm--> body ${message.notification?.body}");
    // print("Fcm--> payload ${message.data}");
    HomePageController().playSound();




  }
  @pragma('vm:entry-point')
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @pragma('vm:entry-point')
   void notificationSetup() async {

    const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(onDidReceiveLocalNotification:onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, macOS: null);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: testing,
        onDidReceiveNotificationResponse: testing
    );
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );



    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    FirebaseMessaging.onMessage.listen((mesg) {
      print("mesg ${mesg}");

    });

  }

  void onDidReceiveLocalNotification(int? id, String? title, String? body, String? payload) async {
    var payloadData = payload;
    return Get.dialog(
        AlertDialog(
          content: Text(payloadData.toString()),
        )
    );
  }

  void testing(NotificationResponse notificationResponse){
    print(notificationResponse.payload.toString());

    return;
  }

   void showNotificationOnForeground(RemoteMessage message) {
    const notificationDetail = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.example.bellnotification1",
            "bellnotification1",
            importance: Importance.max,
            priority: Priority.high,


          fullScreenIntent: true,
          playSound: true,
          enableVibration: true,
          timeoutAfter: 15,







        ));

    flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notificationDetail,
        payload: message.notification!.body,);
  }




  Future<Map<String, dynamic>> notificationLocationRequestByAdmin(String title,String nBody,String topic) async {
    print('notificationTestnotificationTest');
    print(topic);
    print(nBody);
    print(title);
    print('notificationTestnotificationTest');
    String url='https://fcm.googleapis.com/fcm/send';
    var body = json.encode({
      // 'condition': '\'in2024558\' in topics',
      'condition': '\'$topic\' in topics',
      'notification': {
        'body': nBody,
        'title': title,
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'sender_name': 'Location',
      },
      "data": { // Include additional data fields in the notification payload
        "LocationRequest": nBody,
      },
      "android":{
        "notification":{
          "icon":"stock_ticker_update",
          "color":"#7e55c3"
        }
      }
    }
    );
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':'key=AAAA3n89Fxg:APA91bFulMe2SlRAlSPB3GAceBdDxErP-isa8wWJgznJGaMHdI71u-fEZVuDqRjF0qP-csuP3VQ-b07XC4_9fv-ovDRY5dZK072hD6VpX8NqsICEHgxvfuOEOfaSX7UbIKvtGgj2zHmF'

      },
      body: body,
    );
    // todo - handle non-200 status code, etc
    return json.decode(response.body);
  }

}
