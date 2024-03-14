import 'package:bellnotification1/Core/routes.dart';
import 'package:bellnotification1/core/firebase/firebase.dart';
import 'package:bellnotification1/feature/home_page/controller/home_page-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePageView extends GetView<HomePageController> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
          () =>
      controller.loader.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration:  const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: <Color>[
                          Colors.indigo,
                          Colors.blue
                        ]
                    )
                ),
                accountName: Text(FireBase.userInfo['name']),
                accountEmail: Text(FireBase.userInfo['email']),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/Image/Profileimage.png'),
                ),
              ),


              ListTile(
                onTap: (){
                  controller.Logout();
                },
                leading: const Icon(Icons.logout),
                title: const Text("Log out"),
              )
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(FireBase.userInfo['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.height * 0.028)),
                    Text(
                      FireBase.userInfo['email'],
                      style: TextStyle(
                          color: Colors.grey, fontSize: Get.height * 0.018),
                    )
                  ],
                ),
              ),
            ],
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.white, Colors.white])),
          ),
        ),
        body: FireBase.userInfo['role'] == "admin"?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Text(
            //     controller.notificationMsg.value,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            SizedBox(height: Get.height*0.05,),
            Text('Assistant'),
            Container(height: Get.height*0.1,
                child: Card(elevation:5 ,
                  child: ListView.builder(
                    itemCount: FireBase.userInfo['role'] == "admin"
                        ? controller.Alluser.length
                        : 0,
                    itemBuilder: (context, index) {
                      final user = FireBase.userInfo['role'] == "admin"
                          ? controller.Alluser[index]
                          : controller.Alluser[index];
                      return ListTile(
                        title: Text(user),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.indigo,
                          child: IconButton(
                              onPressed: () async {
                                controller.selectedUser.value = user;
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setString('Assistant', user);
                                print(user);
                                controller.localNotificationService.notificationLocationRequestByAdmin(
                                  "Dear Assistant, Alex Calling You",
                                  "Calling",
                                  controller.selectedUser.value,
                                );
                              },
                              icon: const Icon(
                                Icons.notifications,
                                size: 25,
                              )),
                        ),
                        onTap: () {
                          controller.selectedUser.value = user;
                          print(user);
                          controller.localNotificationService.notificationLocationRequestByAdmin(
                            "Dear Assistant, Alex Calling You",
                            "Calling",
                            "BellApp",
                          );
                          // Do something when the user is selected
                        },
                      );
                    },
                  ),
                ),
              ),

            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 30.0, bottom: 3.37),
            //     child: FloatingActionButton(
            //       heroTag: null,
            //       mini: false,
            //       backgroundColor: Colors.orangeAccent,
            //       child: const Icon(Icons.person_add),
            //       onPressed: () {
            //         controller.localNotificationService.notificationLocationRequestByAdmin(
            //           "Dear Assistant, Alex Calling You",
            //           "Calling",
            //           "BellApp",
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        )
            : Center(child: Text('Hello Dear Assistant',style: TextStyle(fontWeight: FontWeight.bold,fontSize: Get.height*0.03,color: Colors.cyan),),),
      ),

    );
  }
}
