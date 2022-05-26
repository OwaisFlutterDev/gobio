import 'package:flutter/material.dart';
import 'package:gobio/constant/constants.dart';
import 'package:gobio/constant/form_validator_constant.dart';
import 'package:gobio/controller/form_validation_controller.dart';
import 'package:gobio/controller/user_auth_controller.dart';
import 'package:gobio/view/widgets/common_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUnScreen extends StatelessWidget{
  SignUnScreen({Key? key}) : super(key: key);

  final FormValidationController formValidationController = Get.put(FormValidationController());
  final UserAuthController userAuthController = Get.put(UserAuthController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
                height: 1.sh,
                width: 1.sw,
                decoration:  BoxDecoration(
                  image:  DecorationImage(image:  AssetImage("assets/bg_image.jpeg"), fit: BoxFit.fill,),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            imageWidget(image: "assets/logo 2.png", height: 260.h, width: 260.w),
                          ],
                        ),
                        //----==-=-= text =-=-=-==-----
                        SizedBox(
                          height: 140.h,
                        ),
                        smallText(
                            title: "Deine",
                            color: lightGreenColor,
                            textAlign: TextAlign.center),
                        largeText(
                          title: "Registrierung",
                          color: greenColor,
                          fontWeight: FontWeight.w600,
                        ),
                        //----==-=-= form =-=-=-==-----
                        SizedBox(
                          height: 180.h,
                        ),
                        Form(
                            key: formValidationController.signUpFormKey,
                            child: Column(
                              children: [
                                commonTextFormField(
                                    hintText: "Deine E-Mail Address",
                                    controller: formValidationController.emailSignUpController,
                                    validator: FormValidatorConstant.emailValidator
                                ),
                                SizedBox(height: 10),
                                commonTextFormField(
                                    hintText: "Password",
                                    obscureText: true ,
                                    controller: formValidationController.passwordSignUpController,
                                    validator: FormValidatorConstant.commonValidator
                                ),
                              ],)),
                        SizedBox(height: 28,),
                        //-----== -=  Anmelden Button =- ==----
                        commonButton(
                            buttonName: "Jetzt registrieren",
                            buttonColor: greenColor,
                            textColor: whiteColor,
                            buttonHeight: 45,
                            buttonWidth: 1.sw,
                            onTap: () {
                              if (formValidationController.signUpFormKey.currentState!.validate()) {
                                userAuthController.signUp();
                              } else {
                                Get.snackbar("SignUp Screen",
                                    "Please Fill All The Fields",
                                    duration: Duration(seconds: 3));
                              }
                            }
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                          height: 40,
                          width: 0.94.sw,
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              commonButton(
                                  buttonName: "Zurück",
                                  buttonColor: Color(0xff65bd01),
                                  textColor: whiteColor,
                                  buttonHeight: 29,
                                  buttonWidth: 1.sw,
                                  textSize: 37.sp,
                                  onTap: () {
                                      Get.back();
                                  }
                              )
                            ],)
                      ),
                      SizedBox(width: 10,),
                    ],
                  )
              ],),
              ),
        ),

    );
  }
}
