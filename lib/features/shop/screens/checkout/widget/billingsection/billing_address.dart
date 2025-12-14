import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../common/widgets/ssectionheader.dart';
import '../../../../../../utils/constants/size.dart';
import '../../../../../personalizations/controllers/addresscontroller.dart';
import '../../../../../personalizations/models/addressmodel.dart';
import '../../../../../personalizations/screens/address/address.dart';
import '../../../../../personalizations/screens/address/widgets/single_address.dart';
import 'defaultaddressscreen.dart';
class BillingAddress extends StatelessWidget {
  BillingAddress({super.key});
  final AddressController addressController = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SSectionHeader(title: 'Shipping Address',buttonTitle: 'change',onPressed: (){Get.to(()=>UserAddressScreen());},),

    Obx(() {
    final AddressModel? defaultAddr = addressController.defaultAddress;

    if (defaultAddr != null) {

    return defaultaddress(address: defaultAddr);
    } else {
      return const Center(child: Text('No default address selected.'));
    }

    }),

    ],);
  }
}


