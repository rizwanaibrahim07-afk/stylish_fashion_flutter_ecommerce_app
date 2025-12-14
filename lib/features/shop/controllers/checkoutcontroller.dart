import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/common/widgets/ssectionheader.dart';

import '../../../utils/constants/size.dart';
import '../model/paymentmethodmodel.dart';
import '../screens/checkout/widget/billingsection/paymenttile.dart';


class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;


  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'cash on delivery', );
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(SSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SSectionHeader(title: 'Select Payment Method',actionButton: false,),
              const SizedBox(height: SSizes.spaceBtwSections),
              SPaymentTile(paymentMethod: PaymentMethodModel(name: 'Cash on delivery', )),
              SizedBox(height: SSizes.spaceBtwItem/2),
              SPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', )),
               SizedBox(height: SSizes.spaceBtwItem/2),
              SPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', )),
              SizedBox(height: SSizes.spaceBtwItem/2),
              SPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA',)),
               SizedBox(height: SSizes.spaceBtwItem/2),

              SPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', )),
               SizedBox(height: SSizes.spaceBtwItem/2),
              const SizedBox(height: SSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }



}