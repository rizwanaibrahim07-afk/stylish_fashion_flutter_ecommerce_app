import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/ssectionheader.dart';
import '../../../../../../utils/constants/size.dart';
import '../../../../controllers/checkoutcontroller.dart';
class BillingPaymentSections extends StatelessWidget {
  const BillingPaymentSections({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:[
      SSectionHeader(title: 'Payment',buttonTitle: 'change',onPressed: (){
        controller.selectPaymentMethod(context);
      },),
          const SizedBox(height: SSizes.spaceBtwItem/2,),
          Obx(() =>Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.labelSmall,)),
    ]);
  }
}
