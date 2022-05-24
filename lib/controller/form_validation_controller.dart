import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormValidationController extends GetxController{

  //   ----- ========== Global Key ========== -----
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();


  //   ----- ========== Text Editing Controller ========== -----
  late  TextEditingController usernameController, emailSignInController, passwordSignInController,
      emailSignUpController, passwordSignUpController,
      conformPasswordController, newPasswordController, newConformPasswordController;

  @override
  void onInit() {
    super.onInit();

    usernameController = TextEditingController();
    emailSignInController = TextEditingController();
    passwordSignInController = TextEditingController();
    emailSignUpController = TextEditingController();
    passwordSignUpController = TextEditingController();
    conformPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    newConformPasswordController = TextEditingController();


  }


  void clearTextField(){
    usernameController.clear();
    emailSignInController.clear();
    passwordSignInController.clear();
    emailSignUpController.clear();
    passwordSignUpController.clear();
    conformPasswordController.clear();
    newPasswordController.clear();
    newConformPasswordController.clear();
  }

}