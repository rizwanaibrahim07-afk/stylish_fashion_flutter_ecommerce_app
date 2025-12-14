import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';
import 'package:stylish_fashion/features/shop/controllers/couponcntroller.dart';


import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helperfunctions.dart';
class CouponCode extends StatelessWidget {
  final controller=Get.put(PromoController());
   CouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final carttotal=CartController.instance.calculateTotal;
    var Promo=TextEditingController();
    final dark=SHelperFunctions.isDarkMode(context);
    return SRoundedContainer(
      showborder: true,
      backgroundColor: dark?SColors.dark:SColors.light,
      padding: EdgeInsets.only(top: SSizes.sm,bottom: SSizes.sm,right: SSizes.sm,left: SSizes.md),
      child: Row(
        children: [
          Flexible(child:
          TextFormField(controller: Promo,
            decoration: const InputDecoration(hintText: 'Have a promo code?Enter here',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none, ),
          ),
          ),
          SizedBox( width: 80,
            child: ElevatedButton(onPressed: (){controller.applyPromo(Promo.text.trim(), carttotal);},style: ElevatedButton.styleFrom(
                foregroundColor: dark?SColors.white:SColors.dark,
                backgroundColor: Colors.grey,side: BorderSide(color: Colors.grey)
            ), child: Text('Apply')),),
        ],
      ),
    );
  }
}
