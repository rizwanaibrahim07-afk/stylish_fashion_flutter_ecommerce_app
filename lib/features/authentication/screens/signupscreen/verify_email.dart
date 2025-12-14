import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
import '../login_screen/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: [IconButton(onPressed: ()=>Get.offAll(()=>const LoginScreen()), icon:const Icon(CupertinoIcons.clear))],),
    body: SingleChildScrollView(
    child: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
    child: Column(
      children: [ Padding(padding: EdgeInsets.all(SSizes.defaultSpace)),
 Image(image: AssetImage(SImages.verifyEmail)),
        SizedBox(height: SSizes.spaceBtwSections,),
        Text("Verify Your Email Address",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
        SizedBox(height: SSizes.spaceBtwItem,),
        Text("Support@stylishfashion.com",style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
        SizedBox(height: SSizes.spaceBtwItem,),
        Text("Congratulations! Your Account Awaits:Verify Your Email to Start Shopping ",
          style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
        SizedBox(height: SSizes.spaceBtwSections,),
        SizedBox(width: double.infinity,child: ElevatedButton(onPressed:(){
          Get.to(()=>const SuccessScreen());
        }, child:const Text('Continue')),),
        SizedBox(height: SSizes.spaceBtwItem,),
        SizedBox(width: double.infinity,child: OutlinedButton(onPressed:(){}, child:const Text('Resend email')),),

      ],
    ),),
    ),
    );
  }
}
