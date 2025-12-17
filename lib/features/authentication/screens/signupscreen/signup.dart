import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helperfunctions.dart';
import '../../../../utils/validators/validator.dart';
import '../../controllers/sign_up_controller.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignupController());
    final dark=SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
              padding:EdgeInsets.all(SSizes.defaultSpace),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create your account',style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: SSizes.spaceBtwSections,),
              Form(
                  key: controller.signupFormKey,
                  child: Column(
                children: [

                  TextFormField(controller: controller.userName,
                    validator: (value)=>SValidator.validateEmptyText('UserName', value),
                    decoration: const InputDecoration(labelText: 'User name',prefixIcon: Icon(Icons.person),),),
                  SizedBox(height: SSizes.spaceBtwItem,),
                  TextFormField(controller: controller.email,
                    validator: (value)=>SValidator.validateEmail( value),
                    decoration: const InputDecoration(labelText: 'email',prefixIcon: Icon(Icons.email),),),
                  SizedBox(height: SSizes.spaceBtwItem,),

                  SizedBox(height: SSizes.spaceBtwItem,),
                  Obx(
                    ()=> TextFormField(controller: controller.password,
                      validator: (value)=>SValidator.validatePassword(value),
                      obscureText:controller.hidePassword.value,decoration: InputDecoration(labelText: 'Password',
                      prefixIcon: const Icon(Icons.password_sharp),
                        suffixIcon: IconButton(
                          icon:Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye),
                          onPressed: () { controller.hidePassword.value=!controller.hidePassword.value; },),),),
                  ),
                  SizedBox(height: SSizes.spaceBtwSections,),
                  Row(
                    children: [
                      SizedBox(height: 24,width: 24,child:
                      Obx(()=>Checkbox(value:controller.privacypolicy.value,
                          onChanged: (value) {controller.privacypolicy.value=!controller.privacypolicy.value;})),),
                      SizedBox(height: SSizes.spaceBtwItem,),
                      Flexible(
                        child: Text.rich(TextSpan(
                            children: [
                          TextSpan(text:'i agree to',style:Theme.of(context).textTheme.bodySmall),
                              TextSpan(text:'  privacy policy ',
                                  style:Theme.of(context).textTheme.bodyMedium!.
                                  apply(color:dark?SColors.white :SColors.primary,
                                    decoration: TextDecoration.underline,decorationColor: dark?SColors.white:SColors.primary)),
                              TextSpan(text:'  and  ',style:Theme.of(context).textTheme.bodySmall),
                              TextSpan(text:'  terms of use  ',
                                  style:Theme.of(context).textTheme.bodyMedium!.
                                  apply(color:dark?SColors.white :SColors.primary,
                                      decoration: TextDecoration.underline,decorationColor: dark?SColors.white:SColors.primary)),
                                            ]),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SSizes.spaceBtwItem,),
                  SizedBox(width:double.infinity,child:
                  Obx(()=>controller.isLoading.value?CircularProgressIndicator():
                  ElevatedButton(onPressed:(){
                    if(controller.signupFormKey.currentState!.validate()){
                    controller.signup(controller.email.text,controller.password.text,);}

    },
    child: Text('Create Account'))),)

    ],
    )),
    SizedBox(height: SSizes.spaceBtwSections,),
    Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Divider(color: dark?SColors.darkGrey:SColors.grey,thickness:0.5,indent: 60,endIndent: 5,),
    Text('Or Sign in with'),
    Divider(color: dark?SColors.darkGrey
    :SColors.grey,thickness:0.5,indent: 5,endIndent: 60,),
                ],
              ),
              SizedBox(height: SSizes.spaceBtwItem,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Container(
                  decoration: BoxDecoration(border: Border.all(color: SColors.grey),
                  ),
                  child: IconButton(onPressed: (){}, icon: const Image(image: AssetImage(SImages.facebook),
                    width: SSizes.xl,height: SSizes.xl,)),
                ),

                  Container(
                    decoration: BoxDecoration(border: Border.all(color: SColors.grey),
                    ),
                    child: IconButton(onPressed: (){}, icon: const Image(image: AssetImage(SImages.google),
                      width: SSizes.xl,height: SSizes.xl,)),
                  )
                ],
              ),
            ],
          ),
            ),
      ),
    );
  }
}
