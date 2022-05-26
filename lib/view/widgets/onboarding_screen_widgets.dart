import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobio/constant/constants.dart';
import 'package:gobio/controller/onboarding_controller.dart';
import 'package:gobio/view/screens/user_auth_screen/signin_screen.dart';
import 'package:gobio/view/screens/user_auth_screen/signup_screen.dart';
import 'package:gobio/view/widgets/common_widgets.dart';
import 'package:geocoding/geocoding.dart';


func() async{

  final OnBoardingController onBoardingController = Get.find<OnBoardingController>();
  Position position = await  onBoardingController.getGeoLocationPosition();
  print('Lat: ${position.latitude} , Long: ${position.longitude}');
  List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  print(placemarks);
  Placemark place = placemarks[0];
  onBoardingController.city.value = "${place.locality}";
  // onBoardingController.update();
}

Widget onBoardingPageThree() {
  return GetBuilder<OnBoardingController>(
    init: null,
    builder: (controller) {
      func();
      return Container(
         color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(children: [
              SizedBox(
                height: 60.h,
              ),
              imageWidget(image: "assets/logo 2.png", height: 260.h, width: 260.w),
              SizedBox(
                height: 300.h,
              ),
              //-----== -= Icons And Text =- ==----

              SizedBox(
                height: 30.h,
              ),
              smallText(
                  title: "Dein Standort",
                  color: lightGreenColor,
                  textAlign: TextAlign.center),
            Obx(() =>  largeText(
                title: controller.city.value,
                color: greenColor,
                fontWeight: FontWeight.w600,
              )),
              // SizedBox(height: 20.h,),

              SizedBox(
                height: 160.h,
              ),
              //-----== -= Registrieren and Anmelden Button =- ==----
              commonButton(
                buttonName: "Registrieren",
                buttonColor: greenColor,
                textColor: whiteColor,
                buttonHeight: 45,
                buttonWidth: 1.sw,
                onTap: () async {
                Get.to(() => SignUnScreen());
                }
              ),
              // SizedBox(height: 10.h,),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignInScreen());
                  },
                  child: commonText(
                      title: "Anmelden",
                      textStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w400))),

              SizedBox(
                height: 200.h,
              ),
              //-----== -= Sofort starten Button =- ==----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                      ),
                      commonText(
                          title: "Einführung überspringen",
                          textStyle: TextStyle(fontSize: 37.sp)),
                    ],
                  ),
                  GetBuilder<OnBoardingController>(builder: (controller) {
                    return CupertinoSwitch(
                      activeColor: greenColor,
                      trackColor: lightGreenColor.withOpacity(0.3),
                      value: controller.switchValue,
                      onChanged: (value) {
                        controller.switchValue = value;
                        controller.update();
                      },
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              commonButton(
                buttonName: "Sofort starten",
                buttonColor: Color(0xff4e8b20).withOpacity(0.7),
                textColor: whiteColor,
                buttonHeight: 45,
                buttonWidth: 1.sw,
              ),
            ]),
          ));
    }
  );
}

Container onBoardingPageTwo() {
  return Container(
    // color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(children: [
          SizedBox(
            height: 60.h,
          ),
          imageWidget(
              image: "assets/logo 2.png", height: 260.h, width: 260.w),
          SizedBox(
            height: 390.h,
          ),
          //-----== -= Icons And Text =- ==----
          onBoardingWidget(
              image: "assets/4.jpeg"
          ),
          SizedBox(
            height: 30.h,
          ),
          largeText(
            title: "Dein nächster Bio-Laden",
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
          // SizedBox(height: 20.h,),
          smallText(
              title: "mit passendem Sortiment",
              color: lightGreenColor,
              textAlign: TextAlign.center),

          SizedBox(
            height: 70.h,
          ),
          //-----== -= Icons And Text =- ==----
          onBoardingWidget(
              image: "assets/1.jpeg"
          ),
          SizedBox(
            height: 30.h,
          ),
          largeText(
            title: "Deine Einkaufsliste",
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
          // SizedBox(height: 20.h,),
          smallText(
              title: "perfekt gefiltert und ausgesucht",
              color: lightGreenColor,
              textAlign: TextAlign.center),
        ]),
      ));
}

Container onBoardingPageOne() {
  return Container(
    // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(children: [
          SizedBox(
            height: 60.h,
          ),
          imageWidget(
              image: "assets/logo 2.png", height: 260.h, width: 260.w),
          SizedBox(
            height: 180.h,
          ),
          //-----== -= Icons And Text =- ==----
          onBoardingWidget(
            image: "assets/5.jpeg"
          ),
          SizedBox(
            height: 30.h,
          ),
          largeText(
            title: "Scanne Deine bisherigen Produkte",
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
          // SizedBox(height: 20.h,),
          smallText(
              title: "und wir zeigen Dir die passenden Bio Produkte",
              color: lightGreenColor,
              textAlign: TextAlign.center),

          SizedBox(
            height: 70.h,
          ),
          //-----== -= Icons And Text =- ==----
          onBoardingWidget(
              image: "assets/2.jpeg"
          ),
          SizedBox(
            height: 30.h,
          ),
          largeText(
            title: "Filtere nach Deinen Wünschen",
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
          // SizedBox(height: 20.h,),
          smallText(
              title: "und",
              color: lightGreenColor,
              textAlign: TextAlign.center),

          SizedBox(
            height: 70.h,
          ),
          //-----== -= Icons And Text =- ==----
          onBoardingWidget(
              image: "assets/3.jpeg"
          ),
          SizedBox(
            height: 30.h,
          ),
          largeText(
            title: "Speichere Deine Favoriten ",
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
          // SizedBox(height: 20.h,),
          smallText(
              title: "die Dir gut tun",
              color: lightGreenColor,
              textAlign: TextAlign.center),
        ]),
      ));
}