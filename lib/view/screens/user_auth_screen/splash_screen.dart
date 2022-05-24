import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobio/view/screens/user_auth_screen/onboarding_screen.dart';
import 'package:gobio/view/widgets/common_widgets.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
      Timer(Duration(seconds: 4), () async {
        Get.offAll(() => OnBoardingScreen());
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Color(0xff1D1D1D),
      body: Stack(
        children: <Widget>[
           Container(
            decoration:  BoxDecoration(
              image:  DecorationImage(image:  AssetImage("assets/bg_image.jpeg"), fit: BoxFit.fill,),
            ),
          ),
           Center(
            child:  imageWidget(
              image: "assets/logo 1.png",
              height: 700.h,
              width: 700.w),
          )
        ],
      )

    );
  }
}