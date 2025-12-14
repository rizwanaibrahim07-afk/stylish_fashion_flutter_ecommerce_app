// lib/screens/reset_password_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../../data/repositories/authentication_repository.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/validators/validator.dart';
import '../controllers/forgotpasswordcontroller.dart';


class NewpasswordresetScreen extends GetView<AuthenticationRepository> {
  const NewpasswordresetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Forgotpasswordcontroller());


    return Scaffold(
      appBar: AppBar(title: Center(child:  Text('Reset Password',style: Theme.of(context).textTheme.headlineSmall,))),
      body: Container(
        child: Form(key: controller.newpasswordFormKey,
          child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Obx(
                      ()=> TextFormField(controller: controller.passwordController,
                    validator: (value)=>SValidator.validatePassword(value),
                    obscureText:controller.hidePassword.value,decoration: InputDecoration(labelText: 'New Password',
                      prefixIcon: const Icon(Icons.password_sharp),
                      suffixIcon: IconButton(
                        icon:Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye),
                        onPressed: () { controller.hidePassword.value=!controller.hidePassword.value; },),),),
                ),
                SizedBox(height: SSizes.spaceBtwSections,),
                  SizedBox(width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          controller.UpdatePassword(controller.passwordController.text);
                        },
                        child: Text('Update Password'),
                      ),
                  ),

                ],
              ),
            ),
        ),
      ),

    );
  }
}
