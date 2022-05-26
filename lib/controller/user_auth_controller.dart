import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gobio/controller/form_validation_controller.dart';


class UserAuthController extends GetxController{

  Future signUp() async{
  try{
    final FormValidationController formValidationController = Get.put(FormValidationController());
    String email = formValidationController.emailSignUpController.text;
    String password = formValidationController.passwordSignUpController.text;

    var response = await post(
        Uri.parse(
            'https://api.gobio.app/user_create.php?i_email=$email&i_password=$password'
        ));

     var jsondecode = jsonDecode(response.body);

     print(jsondecode);

      if(response.statusCode == 200){
        // print("Successfully LogUp");
        if(jsondecode["error"] == 0){
          Get.snackbar(
            "Create Account:",
            "Your Account is Created Successfully",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black54.withOpacity(0.2),
            colorText: Colors.white70,
            duration: Duration(seconds: 5),
          );
          print("Successfully SignUp");
        } else if(jsondecode["error"] == 2){
          Get.snackbar(
            "Create Account:",
            "The Account Already Exists For That Email.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black54.withOpacity(0.2),
            colorText: Colors.white70,
            duration: Duration(seconds: 5),
          );
          print("User Already Exist");
        }
      } else {
        print("response: ${response.statusCode}");
      }

  } catch(e){
    print(e);
  }
}


  Future login() async{
    try{
      final FormValidationController formValidationController = Get.put(FormValidationController());
      String email = formValidationController.emailSignInController.text;
      String password = formValidationController.passwordSignInController.text;

      var response = await post(
          Uri.parse(
              'https://api.gobio.app/api_user_login.php?i_email=$email&i_password=$password'
          ));

      var jsondecode = jsonDecode(response.body);

      print(jsondecode);

      if(response.statusCode == 200){
        // print("Successfully LogUp");
        if(jsondecode["login"] == 0){
          Get.snackbar(
            "Sign In Notification:",
            "Your are Signed In Successfully.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black54.withOpacity(0.2),
            colorText: Colors.white70,
            duration: Duration(seconds: 5),
          );
          print("Successfully SignUp");
        } else if(jsondecode["login"] == 1){
          Get.snackbar(
            "Sign In Notification:",
            "User/Password is Correct But Blocked User.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black54.withOpacity(0.2),
            colorText: Colors.white70,
            duration: Duration(seconds: 5),
          );

        } else if(jsondecode["login"] == 2){
          Get.snackbar(
            "Sign In Notification:",
            "Wrong Password",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black54.withOpacity(0.2),
            colorText: Colors.white70,
            duration: Duration(seconds: 5),
          );

        } else if(jsondecode["login"] == 3){
          Get.snackbar(
            "Sign In Notification:",
            "User Not Exist.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black54.withOpacity(0.2),
            colorText: Colors.white70,
            duration: Duration(seconds: 5),
          );

        }
      } else {
        print("response: ${response.statusCode}");
      }
    } catch(e){
      print(e);
    }
  }
}