import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';
import 'package:stylish_fashion/features/shop/controllers/productbysub.dart';

import '../data/repositories/authentication_repository.dart';
import '../features/authentication/controllers/logincontroller.dart';
import '../features/authentication/controllers/sign_up_controller.dart';
import '../features/shop/controllers/whishlistcontroller.dart';
import '../utils/helpers/networkmanager.dart';
class GeneralBindings extends Bindings{
  @override
void dependencies(){
    Get.put(NetworkManager());
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);

  }
}