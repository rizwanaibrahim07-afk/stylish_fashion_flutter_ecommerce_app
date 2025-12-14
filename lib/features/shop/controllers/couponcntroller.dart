import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/promo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PromoController extends GetxController{
  static PromoController get instance => Get.find();
  final supabase=Supabase.instance.client;
  RxString appliedCode="".obs;
  RxDouble discountamount=0.0.obs;
  RxDouble discount_percentage=0.0.obs;
 RxList promos=<PromoCode>[].obs;

  var isLoading=false.obs;
 @override
 void onInit(){
   Fetchpromo();
   super.onInit();
 }
 Future<void> Fetchpromo()async {
   try {
     isLoading.value=true;

     final data = await supabase
         .from('promo')
         .select();
     promos.value = data.map<PromoCode>((e) => PromoCode.fromJson(e)).toList();
   } catch(e) {
print('error in fectching promo0:$e');
   }finally{
     isLoading.value=false;
   }
 }
 Future<void> applyPromo(String code,double currentCartTotal)async {
   try {
     if (code.isEmpty) {
       Get.snackbar('Error', 'Please enter promocode');
       return;
     }
     final promo = await supabase
         .from('promo')
         .select()
         .eq('code', code)
         .maybeSingle();

     if (promo == null) {
       Get.snackbar('Invalid', 'Promo code not found' ,snackPosition: SnackPosition.BOTTOM,
           margin: EdgeInsets.all(10),borderRadius: 8);
       return;
     }
if(promo['is_active']==false){

    Get.snackbar('Expired', 'promo is expired' ,snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),borderRadius: 8);
    return;
}
discount_percentage.value=(promo['discount_percentage']??0).toDouble();
     double discountAmount =
         currentCartTotal * (discount_percentage / 100);
     discountamount.value=discountAmount;
     appliedCode.value = code;
     Get.snackbar('Success', 'promo applied successfully' ,snackPosition: SnackPosition.BOTTOM,
         margin: EdgeInsets.all(10),borderRadius: 8);
   } catch (e) {
     print("Error in apply promocode:$e");
     print('Entered cod:$code');
     print('Entered discoun:$discount_percentage');

   }
 }
 double getFinalPrice(double cartTotal){
   return cartTotal-discountamount.value+10;
 }
 void removePromo(){
   appliedCode.value='';
   discountamount.value=0.0;

   Get.snackbar('Removed', 'promocode removed' ,snackPosition: SnackPosition.BOTTOM,
       margin: EdgeInsets.all(10),borderRadius: 8);
 }

}