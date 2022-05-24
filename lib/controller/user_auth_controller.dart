import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gobio/controller/form_validation_controller.dart';
import 'package:http/http.dart' as http;

class UserAuthController extends GetxController{

  Future signUp() async{
  try{
    final FormValidationController formValidationController = Get.put(FormValidationController());
    String email = formValidationController.emailSignUpController.text.toString();
    String password = formValidationController.passwordSignUpController.text.toString();

    final response = await http.post(
        Uri.parse(
            'http://api.gobio.app/user_create.php?'
        ),
        body: {
          'i_email': email,
          'i_password': password, //   support only int type of data
        });
     // var jsondecode = jsonDecode(response.body);
     //
     // print(jsondecode);

      if(response.statusCode == 200){
        print("Successfully LogUp");
      } else{
        print(response.statusCode);
      }

  } catch(e){
    print(e);
  }
  }


  Future signIn() async{
    try{

    } catch(e){
      print(e);
    }
  }

}