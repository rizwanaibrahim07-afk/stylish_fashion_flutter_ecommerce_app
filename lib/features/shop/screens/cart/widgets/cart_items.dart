import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:stylish_fashion/features/shop/controllers/cart_controller.dart";
import "package:stylish_fashion/features/shop/model/product_model.dart";

import "../../../../../common/widgets/SVerticalimage/Sroundedimage.dart";
import "../../../../../utils/constants/image_string.dart";
import "../../../../../utils/constants/size.dart";
import "../../../model/cart_item_model.dart";
import "../../widgets/product/product_price_text.dart";
import "../../widgets/product/product_title.dart";
class SCartItem extends StatelessWidget {
  final  CartItemModel product;

  const SCartItem({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<CartController>();
    return Row(children: [
      SRoundedImage(isNetworkImage:true,imageUrl:product.imageUrl! ,width: 60,height: 60,padding: EdgeInsets.all(SSizes.sm),),
      const SizedBox(width: SSizes.spaceBtwItem,),

      Expanded(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Text(product.brandname!),
            Flexible(child: ProductTitleText(text: product.title!,)),
            Text.rich(
                TextSpan(children: [
                  TextSpan(text:'Color ',style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text:'white ',style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(text:'Size ',style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text:'34',style: Theme.of(context).textTheme.bodyMedium),
                ])),

          ],
        ),
      ),

    ],
    );
  }
}
