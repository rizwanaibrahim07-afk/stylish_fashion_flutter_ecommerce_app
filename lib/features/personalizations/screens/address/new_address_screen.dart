import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/addresscontroller.dart';
class NewAddressScreen extends StatelessWidget {


  final RxBool isDefault = false.obs;
  final controller=Get.put(AddressController());
  NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: SAppbar(title: Text('Add New Address'),showBackArrow: true,),
    body: SingleChildScrollView(
         child: Padding(padding:  EdgeInsets.all(SSizes.defaultSpace),
         child: Column(children: [
           TextFormField(controller:controller.nameController,decoration: const InputDecoration(prefixIcon: Icon(Icons.person),labelText: 'Name'),),
           const SizedBox(height: SSizes.spaceBtwInputField,),
           TextFormField(controller:controller.phnumberController,decoration: const InputDecoration(prefixIcon: Icon(Icons.phone_android),labelText: 'Phone Number'),),
           const SizedBox(height: SSizes.spaceBtwInputField,),
          Row(
            children: [
              Expanded(child: TextFormField(controller:controller.houseNameController,decoration: const InputDecoration(prefixIcon: Icon(Icons.house),labelText: 'House Name'),)),
              const SizedBox(width: SSizes.spaceBtwInputField,),
              Expanded(child: TextFormField(controller:controller.postalController,decoration: const InputDecoration(prefixIcon: Icon(Icons.pin),labelText: 'Postal Code'),)),
            ],
          ),
           const SizedBox(height: SSizes.spaceBtwInputField,),
           Row(
             children: [
               Expanded(child: TextFormField(controller:controller.cityController,decoration: const InputDecoration(prefixIcon: Icon(Icons.location_city),labelText: 'City'),)),
               const SizedBox(width: SSizes.spaceBtwInputField,),
               Expanded(child: TextFormField(controller:controller.stateController,decoration: const InputDecoration(prefixIcon: Icon(Icons.location_city_sharp),labelText: 'State'),)),
             ],
           ),
           const SizedBox(height: SSizes.spaceBtwInputField,),
           TextFormField(controller:controller.countryController,decoration: const InputDecoration(prefixIcon: Icon(Icons.location_on),labelText: 'Country'),),
           const SizedBox(height: SSizes.spaceBtwInputField,),
           SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
    controller.addAddress();

             Get.back();
           }, child: Text("Save")),)
         ],),
         ),

    ),);
  }
}
