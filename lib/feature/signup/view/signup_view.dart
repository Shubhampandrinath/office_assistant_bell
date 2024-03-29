import 'package:bellnotification1/Core/routes.dart';
import 'package:bellnotification1/feature/signup/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/components/custombutton.dart';


class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.45,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.indigo]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.17,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.035,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/sign up.png',
                              height: Get.height * 0.12,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .06,
                      left: Get.width * .05,
                      width: Get.width * .9,
                      height: Get.height * .6,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Form(
                                    key: controller.signupformkey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: Get.height * 0.04,
                                        ),
                                        IntlPhoneField(
                                          decoration: const InputDecoration(
                                            counterText: '',
                                            hintText: 'Phone Number',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                          ),
                                          dropdownIconPosition:
                                              IconPosition.trailing,
                                          flagsButtonMargin:
                                              const EdgeInsets.all(10),
                                          initialCountryCode: 'IN',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);
                                            controller.phonevalue =
                                                phone.toString();
                                          },
                                          controller:
                                              SignupController.phoneController,
                                          onCountryChanged: (country) {
                                            controller.countryCode =
                                                country.dialCode;
                                          },
                                          validator: (value) =>
                                              controller.isSignupValid(
                                                  value, 'Enter phone'),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.07,
                                        ),
                                        SizedBox(
                                            width: Get.width - 160,
                                            child: CustomButton(
                                              title: "GET STARTED",
                                              onPress: () {
                                                controller.SignupValidate(
                                                    context);
                                              },
                                            )
                                            //ElevatedButton(
                                            //     onPressed: () {
                                            //       controller.SignupValidate(
                                            //           context);
                                            //     },
                                            //     style: ElevatedButton.styleFrom(
                                            //         backgroundColor: Colors.indigo),
                                            //     child: Text(
                                            //       'REQUEST OTP',
                                            //       style: TextStyle(
                                            //         color: Colors.white,
                                            //         fontSize: Get.height * 0.030,
                                            //       ),
                                            //     )),
                                            )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Row(children: <Widget>[
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 15.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 50,
                                          )),
                                    ),
                                    Text("OR"),
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 15.0, right: 10.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 50,
                                          )),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: Get.width - 140,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          side: BorderSide(
                                              width: 1.4,
                                              color:
                                                  Colors.indigoAccent), // NEW
                                        ),
                                        onPressed: () {
                                          controller.googleLogin(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/Image/google_bg.png",
                                              width: 25,
                                              height: 26,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Signup with Google',
                                              style: TextStyle(
                                                fontSize: Get.height * 0.02,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.010,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Already have an account?'),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.login);
                                          },
                                          child: Text(
                                            'LOGIN',
                                            style:
                                                TextStyle(color: Colors.indigo),
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: Get.height * 0.3)
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
