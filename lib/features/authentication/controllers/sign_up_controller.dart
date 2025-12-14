import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import '../../../common/loader.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../utils/helpers/networkmanager.dart';
import '../../../utils/popups/full_screen_loading.dart';
import '../screens/login_screen/login.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
 final AuthenticationRepository _authenticationRepository=AuthenticationRepository();
 final UserRepository _userRepository=UserRepository();
 var isLoading=false.obs;

  //variables
  final privacypolicy=true.obs;
  final hidePassword=true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final supabase = Supabase.instance.client;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

//...Signup....
  Future<void> signup(String email,String password) async {
    try {
     isLoading.value =true;


//checking Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      //form validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
      //privacypolicy check
      if(!privacypolicy.value){
        SLoaders.warningSnackBar(title: 'Accept privacy policy',message: 'In order to create account,you must have to read and accept the privacy policy and terms of use');
        return;
      }
      final response=await _authenticationRepository.Signup(email, password,);
      final user=response!.user;
      if(user!=null){
        Get.snackbar('Success', 'Signup successfull! Now turn to login',
            snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),borderRadius: 8);
        Get.to(()=>LoginScreen());
      }else{
        Get.snackbar('Error', 'signup failed');
      }


    } catch (e) {

      Get.snackbar('error', 'signup failed' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);

    } finally {
      isLoading.value=false;
      SFullScreenLoader.stopLoading();
    }
  }
}