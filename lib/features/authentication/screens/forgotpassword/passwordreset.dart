import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/forgotpasswordcontroller.dart';
import '../login_screen/login.dart';
class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(SSizes.defaultSpace)),
              Image(image: AssetImage(SImages.verifyEmail)),
              SizedBox(height: SSizes.spaceBtwSections,),
              Text("Password Reset Email Sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: SSizes.spaceBtwItem,),
              Text("Your security our priority,We've sent a secure link to safely change your password and keep your account protected",
                style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: SSizes.spaceBtwSections,),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed:(){
                Get.offAll(()=>const LoginScreen());
              }, child:const Text('Done')),),
              SizedBox(width: double.infinity,child: TextButton(onPressed:(){
               Forgotpasswordcontroller.instance.ResendPasswordResetEmail();
              }, child:const Text('Resend email')),),
            ],
          ),),
      );

  }
}
