import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';


import '../../../../../common/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../../model/cart_item_model.dart';
import '../../../model/product_model.dart';
import '../../cart/cart_screen.dart';
class SBottomAddToCart extends StatelessWidget {
  const SBottomAddToCart({super.key, required this.item, });

final ProductModel item;
  @override
  Widget build(BuildContext context) {
    final cartcontroller=Get.find<CartController>();
    final product=cartcontroller.cartItems.value;
    final dark=SHelperFunctions.isDarkMode(context);
    return Container(padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace,
        vertical: SSizes.defaultSpace/2),
    decoration: BoxDecoration(color: dark?SColors.darkerGrey:SColors.light,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(SSizes.cardRadiusLg),
        topRight: Radius.circular(SSizes.cardRadiusLg)),),
    child: Obx(
            (){ int qty=cartcontroller.getQty(item.id);
        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            children:
              [
                SCircularIcon(icon: Icons.remove , color: SColors.white
              ,onPressed:
                  qty>0?()=>cartcontroller.remove(item.id):null,
                width: 40,height: 40,backgroundColor: SColors.darkGrey,),
              const SizedBox(width: SSizes.spaceBtwItem,),


                Text(qty.toString(),style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: SSizes.spaceBtwItem,),
              SCircularIcon(icon: Icons.add , color: SColors.white,onPressed:(){cartcontroller.add(item.id);},
                width: 40,height: 40,backgroundColor: SColors.darkGrey,),
            ],
          ),
        ElevatedButton(onPressed: (){
          CartController.instance.addToBAG(item);
          Get.to(()=>CartScreen());
          },style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(SSizes.md),backgroundColor: SColors.black),
            child: Text('Add to bag'))
      ],
    );}
    ),
    );
  }
}
