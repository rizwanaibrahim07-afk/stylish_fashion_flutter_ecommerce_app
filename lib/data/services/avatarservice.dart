import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class AvatarService{
  final supabase=Supabase.instance.client;

  //upload avatar
  Future<String?> uploadAvatar(File file,String userId,String? oldPath) async{

    await removeOldAvatar(oldPath);
    final newPath='avatars/$userId.jpg';
    try{
      await supabase.storage.from('avatars').upload(newPath,file,fileOptions: const FileOptions(upsert: true));
      return newPath;
    }catch(e){
      print('upload error:$e');
      return null;
    }
  }
  //remove old avatar
  Future<void> removeOldAvatar(String? oldPath) async{
    if(oldPath==null||oldPath.isEmpty)return;
    try{
      await supabase.storage.from('avatars').remove([oldPath!]);
      print('old profile removed');
    }catch (e){
      print('Error:$e');
    }
  }

//generate signed url
Future<String?> getSignedUrl(String? filePath)async{
    if(filePath==null||filePath.isEmpty)return null;
    try{
      final url=await supabase.storage.from('avatars').createSignedUrl(filePath, 3600);
      return url;
    }catch (e){
      print('error:$e');
      return null;
    }
}
}