import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';

import '../../../../../common/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../widgets/product/product_price_text.dart';
class SProductAddorRemoveButton extends StatelessWidget {
  final CartItemModel product;

  const SProductAddorRemoveButton({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Row(mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: SSizes.spaceBtwItem,),
          SCircularIcon(icon:Icons.remove,width: 32,height: 32,onPressed: (){
            CartController.instance.removeFromCart(ProductModel(id: product.productId, title: product.title!, price: product.salePrice));},
            color: SHelperFunctions.isDarkMode(context)?SColors.white:SColors.black,
            backgroundColor: SHelperFunctions.isDarkMode(context)?SColors.darkGrey:SColors.light,
            size: SSizes.md,),
          SizedBox(width: SSizes.spaceBtwItem,),
          Text('${product.quantity}',style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(width: SSizes.spaceBtwItem,),
          SCircularIcon(icon:Icons.add,width: 32,height: 32,onPressed: (){
            CartController.instance.addToCart(ProductModel( id: product.productId, title: product.title!,
                price: product.salePrice,brandname: product.brandname));},
            color: SColors.white,
            backgroundColor: SColors.primary,
            size: SSizes.md,),

        ]
    );
  }
}
