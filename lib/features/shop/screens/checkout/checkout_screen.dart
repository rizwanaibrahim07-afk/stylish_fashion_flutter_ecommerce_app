


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';
import 'package:stylish_fashion/features/shop/controllers/ordercontoller.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/screens/checkout/payment_success_screen.dart';
import 'package:stylish_fashion/features/shop/screens/checkout/widget/billingsection/billing_address.dart';
import 'package:stylish_fashion/features/shop/screens/checkout/widget/billingsection/billing_payment.dart';
import 'package:stylish_fashion/features/shop/screens/checkout/widget/billingsection/sbilling_section.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helperfunctions.dart';
import '../../controllers/couponcntroller.dart';
import '../cart/widgets/cart_products.dart';
import 'coupon_code.dart';

class CheckoutScreen extends StatelessWidget {
  final controller=Get.put(OrderController());
   CheckoutScreen({super.key, });

  @override
  Widget build(BuildContext context) {

    final dark=SHelperFunctions.isDarkMode(context);
    return Scaffold(appBar: SAppbar(title: Text('CheckOut',style: Theme.of(context).textTheme.headlineMedium),showBackArrow: true,),
        body:SingleChildScrollView(child:  Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              SCartProducts(showAddorRemoveButton: false, ),
              const SizedBox(height: SSizes.spaceBtwItem,),
              CouponCode(),
              const SizedBox(height: SSizes.spaceBtwSections,),
              //Billing Section
              SRoundedContainer(showborder: true,
              backgroundColor: dark?SColors.black:SColors.white,
              padding: EdgeInsets.all(SSizes.md),
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  SBillingSection(),
                  const SizedBox(height: SSizes.spaceBtwItem,),
                  Divider(),
                  const SizedBox(height: SSizes.spaceBtwItem,),
                  //payment section
                 BillingPaymentSections(),
                ],
              ),),
              BillingAddress(),
            ],
          ),
    ),),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
           child: ElevatedButton(onPressed: (){
             controller.placeOrder();
             Get.to(PaymentSuccessScreen());}, child:
           Text('Checkout'),
        ),
      ) ,

    );
  }
}

