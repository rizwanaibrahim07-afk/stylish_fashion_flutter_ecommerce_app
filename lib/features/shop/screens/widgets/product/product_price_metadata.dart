import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/size.dart';

class Productmetadata extends StatelessWidget {
  final ProductModel product;
   Productmetadata({
    super.key, required this.product,
  });
final controller=Get.put(Productcontroller());
  @override
  Widget build(BuildContext context) {
    final discount=controller.getDiscountPercent(product.price, product.salePrice!);
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SRoundedContainer(width: 30,height: 35,
          backgroundColor: Colors.yellowAccent,
          child: Center(child: Text('${discount.toStringAsFixed(0)}%OFF',style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.black),))
          ,),
        //product price
        Row(
          children: [
            Text(product.salePrice.toString(),style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(width: SSizes.spaceBtwItem,),
            Text(product.price.toString(),style: Theme.of(context).textTheme.bodyMedium!.apply(decoration: TextDecoration.lineThrough,
              color: Colors.grey,),),
          ],
        ),
        Text('Price inclusive of all taxes',style: Theme.of(context).textTheme.labelLarge,),
        SizedBox(height:SSizes.spaceBtwItem),
        Row(
          children: [
            Text('status',style: Theme.of(context).textTheme.labelLarge,),
            SizedBox(width: SSizes.spaceBtwItem,),
            Text('InStock',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ), ],
    );
  }
}
