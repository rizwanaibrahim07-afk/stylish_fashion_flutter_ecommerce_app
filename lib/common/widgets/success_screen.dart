import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/screens/login_screen/login.dart';
import '../../utils/constants/image_string.dart';
import '../../utils/constants/size.dart';
import '../styles/spacing_style.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: SSpacingStyles.paddingWithAppBarHeight*2,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(SSizes.defaultSpace)),
            Image(image: AssetImage(SImages.success)),
            SizedBox(height: SSizes.spaceBtwSections,),
            Text("Your Account is created",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: SSizes.spaceBtwItem,),
            Text("Welcome to Your Ultimate Shopping Destination:Your Account is Created ",
              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            SizedBox(height: SSizes.spaceBtwSections,),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed:(){
              Get.to(()=>const LoginScreen());
            }, child:const Text('Continue')),),

          ],
        ),),
      ),
    );
  }
}
