import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gobio/constant/constants.dart';
import 'package:gobio/controller/onboarding_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobio/view/widgets/onboarding_screen_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: GetBuilder<OnBoardingController>(builder: (controller) {
             return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_image.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(bottom: 40),
                  child: PageView(
                    controller: onBoardingController.pageController,
                    children: [
                      //--- page 1 ---
                      onBoardingPageOne(),
                      //--- page 2 ---
                      onBoardingPageTwo(),
                      //--- page 3 ---
                      onBoardingPageThree(),
                    ],
                  ),
                ),

             Positioned(
               bottom: 0,
               child: Container(
                 height: 40,
                 width: 1.sw,
                 color: Colors.transparent,
                 child: Center(
                   child: SmoothPageIndicator(
                     controller: onBoardingController.pageController,
                     count: 3,

                     effect:  SlideEffect(
                         spacing:  8.0,
                         // radius:  4.0,
                         dotWidth:  10.0,
                         dotHeight:  10.0,
                         paintStyle:  PaintingStyle.stroke,
                         strokeWidth:  1,
                         dotColor:  greenColor,
                         activeDotColor:  greenColor
                     ),
                   ),
                 ),
             ),)
        ],
      );
    }),
    );
  }
}
