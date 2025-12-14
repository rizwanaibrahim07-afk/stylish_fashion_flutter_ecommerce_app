import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../../common/loader.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/helpers/networkmanager.dart';
import '../../../utils/popups/full_screen_loading.dart';
class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  final localStorage=GetStorage();
  final hidePassword=true.obs;
  final rememberme=false.obs;
  final AuthenticationRepository _authenticationRepository=AuthenticationRepository();
  final emailcontroller=TextEditingController();
  final passwordcontroller = TextEditingController();

  var isLoading=false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  void onInit(){
    super.onInit();
    //load saved remembermedata
    rememberme.value=localStorage.read('remember_me')??false;
    if(rememberme.value) {
      emailcontroller.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
      passwordcontroller.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    }
 ever(rememberme,(value){localStorage.write('remember_me', value);});

  }

  //login
  Future<void> login(String email,String password) async {
    try {
      isLoading.value = true;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        SLoaders.customToast(message: 'No Internet Connection');
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }


      final response = await _authenticationRepository.login(email, password);
if(response?.user==null){
  Get.snackbar('Error','user not found');
}
      if(response!=null&&response.session!=null) {
        if(rememberme.value){
          localStorage.write('REMEMBER_ME_EMAIL', email);
          localStorage.write('REMEMBER_ME_PASSWORD', password);
        }else{
          localStorage.remove('REMEMBER_ME_EMAIL');
          localStorage.remove('REMEMBER_ME_PASSWORD');
        }
        Get.snackbar('success', 'login successfull' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
        Get.to(() => NavigationMenu());
      }else{
        Get.snackbar('Error', 'Invalid credential' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      }
    } catch (e) {

      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //googleSignin
Future<void>signInWithGoogle()async{
    try{
      isLoading.value=true;
      final response=await _authenticationRepository.SignInWithGoogle();

      if(response!=null&&response.session!=null){
        Get.offAll(()=>NavigationMenu());
        Get.snackbar('Success', 'Successfully signedIn' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      }else{
        Get.snackbar('Error', 'Failed to SignIn With Google' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      }
    }catch(e){
      Get.snackbar('Error', e.toString() ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
    }finally{
      isLoading.value=false;
    }
}
//signout
Future<void>signOut()async{
    await _authenticationRepository.logout();
}
}




