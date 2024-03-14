

import 'package:audioplayers/audioplayers.dart';
import 'package:bellnotification1/services/local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../Core/routes.dart';
import '../../../core/firebase/firebase.dart';


class HomePageController extends GetxController {


  RxString notificationMsg = "Waiting for notifications".obs;
  LocalNotificationService localNotificationService =LocalNotificationService();

  late bool isplaying;
  late AudioPlayer player;
  RxBool loader = true.obs;
  RxString selectedUser=''.obs;
  RxList Alluser = [].obs;
  final audioPlayer = AudioPlayer();


  Future<void> onInit() async {
    super.onInit();
    var db=await Hive.openBox('mytask');
    FireBase.userInfo.value=db.get('userInfo');
    player = AudioPlayer();
    getUser();
    localNotificationService.notificationSetup();
    topic();


    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        var calling= message.data["LocationRequest"];
        print('callingShubh');
        print(calling);
        print('callingShubh');
        if(calling!=null){
          playSound();
          Get.dialog(
            AlertDialog(
              title: Text(message.notification!.title!),
              content: Text(message.notification!.body!),
              actions: [

                TextButton(
                  onPressed: () {
                    Get.back();
                    // Navigator.of(context).pushNamed(screen);
                  },
                  child: const Text('Open Screen'),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Dismiss'),
                ),
              ],
            ),
          );




        }

          notificationMsg.value = "${message.notification!.title} ${message.notification!.body} I am coming from terminated state";
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((message) {
      localNotificationService.showNotificationOnForeground(message);
      if (message != null) {
        var calling= message.data["LocationRequest"];
        print('callingShubh');
        print(calling);
        print('callingShubh');
        playSound();
        if(calling!=null){
          Get.dialog(
             AlertDialog(
              title: Text(message.notification!.title!),
              content: Text(message.notification!.body!),
              actions: [

                TextButton(
                  onPressed: () {
                    Get.back();
                    // Navigator.of(context).pushNamed(screen);
                  },
                  child: const Text('Open Screen'),
                ),
                TextButton(
                  onPressed: () {
                    stopAlarm();
                    Get.back();
                    print("*****Opened notification*****");
                    // alarmPlayer.isResponded = true;
                    // alarmPlayer.stopAlarm();

                  } ,
                  child: const Text('Dismiss'),

                ),
              ],
            ),
          );

        }

      }
      else{
        notificationMsg.value = "${message.notification!.title} ${message.notification!.body} I am coming from terminated state";
        print(notificationMsg.value);
      }

    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message != null) {
        var calling= message.data["LocationRequest"];
        print('callingShubh');
        print(calling);
        print('callingShubh');
        playSound();
        if(calling!=null){
          Get.dialog(
            AlertDialog(
              title: Text(message.notification!.title!),
              content: Text(message.notification!.body!),
              actions: [

                TextButton(
                  onPressed: () {
                    Get.back();
                    // Navigator.of(context).pushNamed(screen);
                  },
                  child: const Text('Open Screen'),
                ),
                TextButton(
                  onPressed: () {
                    stopAlarm();
                    Get.back();
                    print("*****Opened notification*****");
                    // alarmPlayer.isResponded = true;
                    // alarmPlayer.stopAlarm();

                  } ,
                  child: const Text('Dismiss'),

                ),
              ],
            ),
          );

        }

      }
      else{
        notificationMsg.value = "${message.notification!.title} ${message.notification!.body} I am coming from terminated state";
        print(notificationMsg.value);
      }
    });
  }

  Future<void> stopAlarm() async {
    await audioPlayer.stop();
    print("Alarm stopped");
    // await player.stop();
  }


  Future<void> playSound() async {
    try {
      await audioPlayer.play(AssetSource("kl.mp3"));
    } catch (t) {
      //Empty sound
    }
  }

  getUser() async {
    await FirebaseFirestore.instance
        .collection('mytask/mytask/users/').where('role', isEqualTo: 'user')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Alluser.add(doc["name"]);
      });
    });
    print('$Alluser');
    loader.value=false;
  }


  topic() async {
    final prefs = await SharedPreferences.getInstance();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    var assist;
    assist =prefs.getString('Assistant');
    print("assist");
    print(assist);
    print("assist");
    await firebaseMessaging.subscribeToTopic(assist);
  }

  Logout()async{
    final pref = await SharedPreferences.getInstance();
    await FirebaseMessaging.instance.deleteToken();
    await pref.clear().then((value) {
      Get.offAllNamed(Routes.login);
    });
  }
}



