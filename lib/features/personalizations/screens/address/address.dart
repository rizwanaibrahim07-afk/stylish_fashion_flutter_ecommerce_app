import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/personalizations/screens/address/widgets/single_address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/addresscontroller.dart';
import 'new_address_screen.dart';
class UserAddressScreen extends StatelessWidget {
  final controller=Get.put(AddressController());
   UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(onPressed: ()=>Get.to(()=> NewAddressScreen()),
      backgroundColor: SColors.primary,child: Icon(Icons.add,color: Colors.white,),),
      appBar: SAppbar(showBackArrow: true,
        title: Text("Addresses",style: Theme.of(context).textTheme.headlineMedium,),),
      body:Obx(
          (){ if(controller.loading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if(controller.addresses.isEmpty){
            return Center(child: Text('No addresses added yet',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(SSizes.defaultSpace),
            itemCount: controller.addresses.length,separatorBuilder: (_,_)=>const SizedBox(height:SSizes.defaultSpace),
            itemBuilder: (context,index){
              final address=controller.addresses[index];
              return SSingleAddress(address:address,onSetDefault:()=>controller.setDefault(address.id),
                  onDelete:()=>controller.deleteAddresses(address.id));
            }
            );
          },
      ),

    );
  }
}
