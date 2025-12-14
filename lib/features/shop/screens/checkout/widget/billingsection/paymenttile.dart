

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../controllers/checkoutcontroller.dart';
import '../../../../model/paymentmethodmodel.dart';


class SPaymentTile extends StatelessWidget {
  const SPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },

      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}