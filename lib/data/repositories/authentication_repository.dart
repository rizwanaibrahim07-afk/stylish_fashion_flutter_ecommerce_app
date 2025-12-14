

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/authentication/screens/login_screen/login.dart';
import '../../features/authentication/screens/onboardingscreen/onboarding.dart';
class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=>Get.find();
     final deviceStorage=GetStorage();
     final supabase = Supabase.instance.client;
     final isLoading=false.obs;
     final rememberMe=false.obs;
  final _googleSignIn = GoogleSignIn.instance;

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  screenRedirect() async {
    //local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() =>LoginScreen()) : Get.offAll(() =>OnBoardingScreen() );
  }
    Future<AuthResponse?>Signup( String email,String password)async{
    try{
      isLoading.value=true;

      final response=await supabase.auth.signUp(email:email,password: password);
      return response;

    }on AuthException catch (e) {
      throw Exception(e.message);
    }catch(e){
      throw Exception('Unexpected error:$e');
    }finally{
      isLoading.value=false;
      }
  }

  void saveSession(Session session){
    if(rememberMe.value){
      deviceStorage.write('session', session.toJson());
    }
  }
// login


  Future<AuthResponse?> login(String email,String password)async{
    try{
      isLoading.value=true;
      final response=await supabase.auth.signInWithPassword(email:email,password: password);
      return response;
    }on AuthException catch (e) {
      throw
      Exception(e.message);
    }catch(e){
      throw Exception('Login Failed:$e');
    }finally{
      isLoading.value=false;
    }
  }


  //googlesignin
  Future<AuthResponse?> SignInWithGoogle() async{
    try {
      const iosClientId = '210231020181-0sj5tk83hd9b7b5mtcfsme73j06flosn.apps.googleusercontent.com';
      const serverClientId = '210231020181-nh02164kjjncth97mhr5k55ouh4fgng2.apps.googleusercontent.com';

      final scopes = ['email', 'profile'];
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
    serverClientId: serverClientId,
    clientId: iosClientId,
    );

    final googleUser = await googleSignIn.attemptLightweightAuthentication();
    // or await googleSignIn.authenticate(); which will return a GoogleSignInAccount or throw an exception

    if (googleUser == null) {
    throw AuthException('Failed to sign in with Google.');
    }

    /// Authorization is required to obtain the access token with the appropriate scopes for Supabase authentication,
    /// while also granting permission to access user information.
    final authorization =
    await googleUser.authorizationClient.authorizationForScopes(scopes) ??
    await googleUser.authorizationClient.authorizeScopes(scopes);

    final idToken = googleUser.authentication.idToken;

    if (idToken == null) {
    throw AuthException('No ID Token found.');
    }

    final response=await supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: authorization.accessToken,
    );
    return response;
    }
    catch(e){
Get.snackbar('Error', 'Failed to signin');
    }
    return null;
    }






  //logout
  Future<void> logout() async{
    try{
      await supabase.auth.signOut();
      await _googleSignIn.signOut();
await _googleSignIn.disconnect();
      Get.offAll(()=>LoginScreen());
print('logout successfully');
    }catch(e){
      print("logout error $e");
    }
  }



  //forgot password
Future<void> forgotPassword(String email) async{
    try{
      await supabase.auth.resetPasswordForEmail(email,redirectTo:'stylishfashion://login-callback/ ',);

}catch(e){
  rethrow;
  }
}


  Future<void> updateUserPassword(String newPassword) async {

    try {
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
      Get.snackbar(
        'Success',
        'Password updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(()=>LoginScreen()); // Navigate to login screen
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }



//get current user
String? getCurrentUserEmail(){
    final session=supabase.auth.currentSession;
    final user=session?.user;
    return user?.email;
}
//get current vsession
Session?get currentSession=>supabase.auth.currentSession;
}