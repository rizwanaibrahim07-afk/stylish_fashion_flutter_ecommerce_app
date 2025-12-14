import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/couponcntroller.dart';

import '../../../../../../utils/constants/size.dart';
import '../../../../controllers/cart_controller.dart';
class SBillingSection extends StatelessWidget {
  final controller=Get.put(PromoController());
   SBillingSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx((){

    final cartTotal=CartController.instance.calculateTotal;
    final cuponDiscount=controller.discountamount;
    return Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,),
              Text('\$${cartTotal}',style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
          const SizedBox(height: SSizes.spaceBtwItem/2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium,),
              Text('\$0.0',style: Theme.of(context).textTheme.labelLarge,),
            ],
          ),
          const SizedBox(height: SSizes.spaceBtwItem/2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('couponcode',style: Theme.of(context).textTheme.bodyMedium,),
              Text('\$${cuponDiscount}',style: Theme.of(context).textTheme.labelLarge,),
            ],
          ),
          const SizedBox(height: SSizes.spaceBtwItem/2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax fee',style: Theme.of(context).textTheme.bodyMedium,),
              Text('\$10',style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
          const SizedBox(height: SSizes.spaceBtwItem/2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
              Text('\$${PromoController.instance.getFinalPrice(cartTotal)}',style: Theme.of(context).textTheme.titleMedium),]),
        ],
      );}
    );
  }
}
