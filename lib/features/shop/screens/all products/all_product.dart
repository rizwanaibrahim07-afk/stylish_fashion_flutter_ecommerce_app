import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/screens/all%20products/sorting_product.dart';


import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';
import '../../model/cart_item_model.dart';
class AllProduct extends StatelessWidget {

  final controller=Get.put(Productcontroller);
AllProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: SAppbar(title: Text('Popular Products'),showBackArrow: true,),
        body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
        child: SortingProduct(),),
        ),
    );
  }
}

