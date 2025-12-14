import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../data/repositories/authentication_repository.dart';
import '../../../utils/helpers/networkmanager.dart';
import '../screens/forgotpassword/passwordreset.dart';
import '../screens/newpasswordreset.dart';
class Forgotpasswordcontroller extends GetxController{
  static Forgotpasswordcontroller get instance=>Get.find();

  final email=TextEditingController();
  GlobalKey<FormState> forgetpasswordFormkey= GlobalKey<FormState>();
  GlobalKey<FormState> newpasswordFormKey = GlobalKey<FormState>();
  final hidePassword=true.obs;
  final passwordController = TextEditingController();
  sendPasswordResetEmail()async {
    try {
      Get.snackbar('Processing', 'Processing your request......' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!forgetpasswordFormkey.currentState!.validate()) {
        return;
      }
      await AuthenticationRepository.instance.forgotPassword(email.text.trim());
      Get.snackbar('Email Sent', 'Email Link Sent to Reset Your Password' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
      Get.to(() => PasswordReset());
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }
    ResendPasswordResetEmail()async{
      try{
        Get.snackbar('Processing', 'Processing your request......' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
        final isConnected=await NetworkManager.instance.isConnected();
        if(!isConnected){
          return;
        }


        await AuthenticationRepository.instance.forgotPassword(email.text.trim());
        Get.snackbar('Email Sent', 'Email Link Sent to Reset Your Password' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
        Get.to(()=>NewpasswordresetScreen());
      }catch (e){
        Get.snackbar('Error', 'Something went wrong' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      }
    }
  UpdatePassword(String newpassword)async{
    try{
    await AuthenticationRepository.instance.updateUserPassword(newpassword);
    }catch (e){
      Get.snackbar('Error', 'Something went wrong' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
    }
  }


  }
