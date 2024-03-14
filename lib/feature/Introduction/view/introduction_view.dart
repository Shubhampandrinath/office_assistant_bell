import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:bellnotification1/Core/routes.dart';
import 'package:bellnotification1/core/components/custombutton.dart';
import 'package:bellnotification1/feature/Introduction/controller/introduction_controller.dart';

class IntroView extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        margin:EdgeInsets.fromLTRB(10, 90, 10, 0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: IntroductionScreen(
              pages: [
                PageViewModel(
                    title: 'Welcome to Assistant Bell ${"Let's"} customize your notifications and never miss a ring',
                    image: Image.asset('assets/Image/1onboarding.png'),
                    bodyWidget: Column(
                      children: [
                        SizedBox(
                          height: Get.height*0.01,
                        ),
                        SizedBox(
                          width: Get.width*0.6,
                          child: CustomButton(
                            title: "GET STARTED",
                            onPress: () {Get.toNamed(Routes.login);


                            },)
                        )
                      ],
                    ),

                    decoration: PageDecoration( titleTextStyle: TextStyle(color: Colors.black,fontSize: Get.height*0.03, fontWeight: FontWeight.w500),
                    )),
                PageViewModel(

                    title: 'Stay on top of your work with the help of Assistant Bell',
                    image: Image.asset('assets/Image/2onboarding.png'),

                    bodyWidget: Column(
                      children: [

                        SizedBox(
                          height: Get.height*0.01,
                        ),
                        SizedBox(
                          width: Get.width*0.6,
                           child: CustomButton(
                             title: "GET STARTED",
                             onPress: () {Get.toNamed(Routes.login);


                             },)

                        ),
                      ],
                    ),
                    decoration: PageDecoration(titleTextStyle: TextStyle(color: Colors.black,fontSize: Get.height*0.03, fontWeight: FontWeight.w500),)),
                PageViewModel(

                    title: 'Assistant Bell keeps it simple and lets you focus on your work',
                    image: Image.asset('assets/Image/3onboarding.png'),
                    bodyWidget: Column(
                      children: [
                        SizedBox(
                          height: Get.height*0.01,
                        ),
                        SizedBox(
                          width: Get.width*0.6,
                          child:
                          CustomButton(
                            title: "GET STARTED",
                            onPress: () {Get.toNamed(Routes.login);


                            },
                          ),
                          //ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.indigo,
                          //       shape:BeveledRectangleBorder()),
                          //   child: Text("GET STARTED",
                          //       style: TextStyle(color: Colors.white, fontSize:Get.height*0.030)),
                          //   onPressed: () { Get.toNamed(Routes.login);},
                          // ),
                        )
                      ],
                    ),
                    decoration: PageDecoration(titleTextStyle: TextStyle(color: Colors.black,fontSize: Get.height*0.03, fontWeight: FontWeight.w500),)),
              ],
              dotsDecorator: const DotsDecorator(

                color: Colors.grey,
                activeColor: Colors.indigo,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)
                  ),
                ),
                shape: RoundedRectangleBorder(
                  //shape of active dot
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),

              onDone: () {
                Get.toNamed(Routes.login);
              },
              autoScrollDuration: 3000,
              showDoneButton: false,
              showNextButton: false,
              showSkipButton: false,
              showBackButton: false,

              skip: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: StadiumBorder()),
                child: Text("GET STARTED",
                    style: TextStyle(color: Colors.white, fontSize: Get.height*0.030)),
                onPressed: () { Get.toNamed(Routes.login);},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
