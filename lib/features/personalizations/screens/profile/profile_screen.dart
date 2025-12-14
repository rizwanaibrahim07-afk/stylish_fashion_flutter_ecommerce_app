import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish_fashion/features/personalizations/screens/profile/widgets/profile_menu.dart';
import 'package:stylish_fashion/features/shop/screens/homeScreen.dart';

import '../../../../common/images/SCircularImage.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/ssectionheader.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
import '../../../shop/model/cart_item_model.dart';
import '../../controllers/profile_controller.dart';
class ProfileScreen extends StatelessWidget {

final controller=Get.put(ProfileController());

Future<void> _showEditDialog(String title,String field)async{
  final TextEditingController input=TextEditingController();
  Get.defaultDialog(title: 'Edit $title',content: TextField(controller: input,
    decoration: InputDecoration(labelText: 'Enter new $title'),),
  confirm: ElevatedButton(onPressed: ()async{
final value=input.text.trim();
    await controller.updateField(field, value);
    Get.back();
  }, child: const Text('save'),),cancel: TextButton(onPressed: Get.back, child: Text('cancel')));
}

   ProfileScreen({super.key, });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: SAppbar(title:Text( 'Profile',style: Theme.of(context).textTheme.headlineMedium,),
       showBackArrow: true,),
    body:
             Obx((){

               if(controller.isLoading.value||controller.profile.value==null){
                 return Center(child: const CircularProgressIndicator());
               }
               final user=controller.profile.value!;
               return SingleChildScrollView(child: Column(
                 children: [
                   SizedBox(width:double.infinity,child: SCircularImage(

                     image: controller.avatarUrl.value??SImages.user1,
                     width: 100,height: 100,),),
                   GestureDetector(onTap:()async{
                     final picker=ImagePicker();
                     final picked=await picker.pickImage(source: ImageSource.gallery);
                     if(picked!=null){
                       final file=File(picked.path);
                       await controller.changeAvatar(file);
                     }
                     },child: Text('Change your profile image')),
                   const SizedBox(height: SSizes.spaceBtwSections,),

                   Divider(color: SColors.darkGrey,thickness: 0.5,),
                   const SizedBox(height: SSizes.spaceBtwItem,),
                   SSectionHeader(title: 'Profile Information',actionButton: false,),
                   const SizedBox(height: SSizes.spaceBtwItem,),
                   Profilemenu(icon:Icons.arrow_right, onPressed: () {
                    _showEditDialog('name', 'name');
                   }, title: 'Name', value:user.name??'' ,),
                   Profilemenu(icon: Icons.arrow_right, onPressed: () { _showEditDialog('userName', 'userName');
                   }, title: 'UserName', value:user.userName??'',),
                   Profilemenu(icon: Icons.arrow_right, onPressed: () { _showEditDialog('Phone number', 'phoneNumber'); },
                     title: 'Ph:No', value:user.phoneNumber??''),
                   Profilemenu(icon: Icons.arrow_right, onPressed: () {  _showEditDialog('email', 'email'); },
                       title: 'E-mail', value:user.email??'' ),
                   const SizedBox(height: SSizes.spaceBtwItem,),
                   const Divider(),
                   Center(child: TextButton(onPressed: (){ Get.to(()=>HomeScreen());}, child: Text('close profile',style: TextStyle(color: Colors.red),)))



                 ],
               ),
               );
             },
             ),

    );
  }
}


