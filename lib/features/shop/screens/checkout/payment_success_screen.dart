import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/styles/spacing_style.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: SSpacingStyles.paddingWithAppBarHeight*2,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(SSizes.defaultSpace)),
              Image(image: AssetImage(SImages.success)),
              SizedBox(height: SSizes.spaceBtwSections,),
              Text("Payment Success",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: SSizes.spaceBtwItem,),
              Text("Yor item will shipped soon ",
                style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: SSizes.spaceBtwSections,),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed:(){
                Get.offAll(()=>const NavigationMenu());
              }, child:const Text('Continue')),),

            ],
          ),),
      ),
    );
  }
}



