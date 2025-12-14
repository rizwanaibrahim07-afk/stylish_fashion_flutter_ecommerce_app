import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish_fashion/data/services/avatarservice.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/repositories/user_repository.dart';
import '../models/user_model.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();
  final UserRepository _userRepository=UserRepository();
 final avatarService=AvatarService();
  Rx<UserModel?> profile=Rx<UserModel?>(null);
  RxBool isLoading=false.obs;
 RxString avatarUrl=''.obs;
  RxString avatarPath=''.obs;


  void onInit(){
     loadProfile();
     loadAvatar();
     super.onInit();
   }
  //load profile\'

  Future<void> loadProfile() async{
    try{
      final user=Supabase.instance.client.auth.currentUser;
      isLoading.value=true;
       profile.value=await _userRepository.getProfile(user!.id);

      } catch (e){
        print('error fetching user:$e');
    }finally{
        isLoading.value=false;
    }
    }

Future<void> loadAvatar() async{
    final user=Supabase.instance.client.auth.currentUser;
    if(user==null)return;
    final data=await _userRepository.getProfile(user.id);
    final path=data!.avatarUrl;
    avatarPath.value=path??'';
    final url=await avatarService.getSignedUrl(path);
    avatarUrl.value=url??'';

}
Future<void> changeAvatar(File file)async{
    final user=Supabase.instance.client.auth.currentUser;
    if(user==null)return;
    final newPath=await avatarService.uploadAvatar(file, user.id, avatarPath.value,);
      if(newPath==null)return;
      await _userRepository.updateProfilePhoto(user.id, newPath);
      await loadAvatar();
}







Future<void>updateField(String field,dynamic value)async{
    await _userRepository.updateProfileField(field, value);
    await loadProfile();

    Get.snackbar('updated', '$field updated successfully');

}
  }



