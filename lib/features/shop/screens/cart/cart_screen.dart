import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';
import 'package:stylish_fashion/features/shop/screens/cart/widgets/cart_products.dart';


import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/productcontroller.dart';
import '../../model/product_model.dart';
import '../checkout/checkout_screen.dart';
class CartScreen extends StatelessWidget {

final controller=Get.put(CartController());
  CartScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: SAppbar(title: Text('Cart', style: Theme
        .of(context)
        .textTheme
        .headlineMedium), showBackArrow: true,),
      body: Obx((){
          if (controller.isLoading.value)
            return Center(child: CircularProgressIndicator());
          if (controller.cartItems.isEmpty) {
            return Center(child: Text('No product added to cart'));
          }
            return Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  SCartProducts(),
                  SizedBox(height: SSizes.spaceBtwSections,),
              Padding(
                padding: const EdgeInsets.all(SSizes.defaultSpace),
                child: SizedBox(width: double.infinity,
                  child: ElevatedButton(onPressed: () {

                    Get.to(CheckoutScreen());},
                    child: Text('Checkout \$${controller.calculateTotal}'),
                  ),
                ),
              ),
                ],
              ),);
      }),);
  }

}
