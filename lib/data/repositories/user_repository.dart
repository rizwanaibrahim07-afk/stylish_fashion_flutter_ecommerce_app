import 'dart:io';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/personalizations/models/user_model.dart';
class UserRepository extends GetxController{
final supabase=Supabase.instance.client;

//GET CURRENT USER
  Future<UserModel?> getProfile(String id) async {
    final user = supabase.auth.currentUser;

    if (user == null) return null;
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();
    return UserModel.fromMap(response);
  }
//update photo in profile table
  Future<void> updateProfilePhoto(String userId,String avatarPath) async{
    await supabase.from('profiles').update({'avatarUrl':avatarPath,}).eq('id', userId);
  }
  
 
  //updatefields

  Future<void> updateProfileField(String field,dynamic value) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return;
      await supabase.from('profiles').update({field: value}).eq('id', user.id);
    } catch (e) {
      print('error: $e');
    } finally {

    }
  }

}