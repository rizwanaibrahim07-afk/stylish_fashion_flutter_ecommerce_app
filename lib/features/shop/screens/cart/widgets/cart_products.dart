import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';

import '../../../../../utils/constants/size.dart';
import '../../../controllers/cart_controller.dart';
import '../../widgets/product/product_price_text.dart';
import 'add_remove_button.dart';
import 'cart_items.dart';
class SCartProducts extends StatelessWidget {
  const SCartProducts({
    super.key,  this.showAddorRemoveButton=true,
  });
  final bool showAddorRemoveButton;

  @override
  Widget build(BuildContext context) {
      final controller=Get.find<CartController>();
    return  ListView.separated(
        separatorBuilder: (_,__)=>const SizedBox(height:SSizes.spaceBtwItem),
        itemCount: controller.cartItems.length,shrinkWrap: true,
        itemBuilder: (_,index){
         final product=controller.cartItems[index];

          return Column(

          children: [
            SCartItem(product:product),
            if(showAddorRemoveButton)
            SizedBox(height: SSizes.spaceBtwItem,),
            if(showAddorRemoveButton)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Extra Space
                SizedBox(width: 60,),
                SProductAddorRemoveButton(product: product,),
                ProductPriceText(price:'${controller.itemtotalprice(
                    CartItemModel(id:product.id, quantity:product.quantity,
                        productId: product.productId, salePrice: product.salePrice,))}' ,),
              ]
            ),

          ],
        );}
      );
  }
}

