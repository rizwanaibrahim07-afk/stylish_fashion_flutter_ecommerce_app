import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/size.dart';
import '../../../../../utils/validators/validator.dart';
import '../../../controllers/logincontroller.dart';
import '../../forgotpassword/forgotpassword.dart';
import '../../signupscreen/signup.dart';

class Loginform extends StatelessWidget {
  const Loginform({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Container(
      child: Form(
          key:controller.loginFormKey,
        child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: SSizes.spaceBtwSections),
        child: Column(
            children: [
              SizedBox(height: SSizes.md,),
              TextFormField(
                validator: (value) => SValidator.validateEmail(value),
                controller: controller.emailcontroller,
                decoration: const InputDecoration(prefixIcon: Icon(Icons
                    .email), labelText: ' E-mail'),),
              SizedBox(height: SSizes.spaceBtwInputField,),
              Obx(
                    () =>
                    TextFormField(
                      validator: (value) =>
                          SValidator.validatePassword(value),
                      controller: controller.passwordcontroller,
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                                controller.hidePassword.value ? Iconsax
                                    .eye_slash : Iconsax.eye),
                            onPressed: () {
                              controller.hidePassword.value =
                              !controller.hidePassword.value;
                            },), labelText: 'Password'),),
              ),
              SizedBox(height: SSizes.defaultSpace,),

          Row(
            children:

                      [

                            Obx(
              () =>Checkbox(value: controller.rememberme.value, onChanged: (value) =>controller.rememberme.value=value??false,),
                            ),


                        const Text('Remember me',
                          style: TextStyle(fontSize: SSizes.fontSizeSm),
                        ),
                      ],
                    ),
              TextButton(onPressed: (){Get.to(()=>Forgotpassword());
              },
                  child: Text('Forgot password?', style: TextStyle(
                      fontSize: SSizes.fontSizeSm))
              ),
              SizedBox(height: SSizes.spaceBtwItem,),
              SizedBox(width: double.infinity, child: Obx(
                    () =>
                controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(onPressed: () {
                  controller.login(controller.emailcontroller.text,controller.passwordcontroller.text);
                }, child: Text('Sign In')),
              )),
              SizedBox(height: SSizes.spaceBtwItem,),
              SizedBox(width: double.infinity, child: OutlinedButton(
                  onPressed: () {
                    Get.to((() => Signup()));
                  }, child: Text('Create an account'))),
            ]
        ),
      ),
      ),
    );
  }
}


