import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final SupabaseClient supabase = Supabase.instance.client;
  // Reactive list to store items in the cart
  var cartItems = <CartItemModel>[].obs;
 var isLoading=false.obs;
    final user_id=Supabase.instance.client.auth.currentUser!.id;
var selectedProduct=Rxn<ProductModel>();
RxMap productQuantity=<int,int>{}.obs;
  @override
  void onInit() {
    fetchCart();
    super.onInit();

  }

int getQty(int productId){
return productQuantity[productId]??1;
  }
  void add(int productId){
    productQuantity[productId]=getQty(productId)+1;
  }
  void remove(int productId){
    int currentqty=getQty(productId);
    if(currentqty>0){
      productQuantity[productId]=currentqty-1;
    }
  }
  Future<void> addToBAG(ProductModel product) async {
    try {
int qty=getQty(product.id);
if(qty==0)return;
      final exist = await supabase.from('carts').select().eq(
          'product_id', product.id).
      eq('user_id', user_id);
      if (exist.isNotEmpty) {
        await supabase.from('carts').update(
            {'quantity': exist.first['quantity'] +  qty}).
        eq('id', exist.first['id']);

      } else {
        await supabase.from('carts').insert({
          'product_id': product.id,
          'title': product.title,
          'imageUrl': product.imageUrl,
          'salePrice': product.salePrice,
          'user_id': user_id,
          'quantity': qty
        });
      }fetchCart();

    } catch (e) {
      print("error in add to cart:$e");
    }
  }
double itemtotalprice(CartItemModel item){
    return item.salePrice*item.quantity;
}
  Future<void> addToCart(ProductModel product) async {
    try {

      final exist = await supabase.from('carts').select().eq(
          'product_id', product.id).
      eq('user_id', user_id);
      if (exist.isNotEmpty) {
        await supabase.from('carts').update(
            {'quantity': exist.first['quantity'] + 1}).
        eq('id', exist.first['id']);

      } else {
        await supabase.from('carts').insert({
          'product_id': product.id,
          'title': product.title,
          'imageUrl': product.imageUrl,
          'salePrice': product.salePrice,
          'user_id': user_id,
          'quantity': 1
        });
      }fetchCart();

    } catch (e) {
      print("error in add to cart:$e");
    }
  }
  Future<void> removeFromCart(ProductModel product) async{
    try{
      final userId=supabase.auth.currentUser!.id;
      final data=await supabase.from('carts').select().eq('product_id',product.id).eq('user_id', userId).maybeSingle();
      if(data==null)return;
      int currentqty=data['quantity'];
      if(currentqty>1){
        await supabase.from('carts').update({'quantity':currentqty-1}).eq('id',data['id']);
      }else {
        await supabase.from('carts').delete().eq('product_id', product.id);
      }
        fetchCart();
    }catch (e){
      print("error in remove from cart:$e");
    }
  }

  double get calculateTotal{
    return cartItems.fold(0, (sum,item)=>sum+(item.salePrice*item.quantity));

  }


  Future<void> fetchCart() async {
    try {
      isLoading.value=true;
      final  response = await supabase
          .from('carts')
          .select('*,products(*)')
          .eq('user_id', user_id);
 cartItems.value=response.map((e)=>CartItemModel.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products: $e' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
    }finally{
      isLoading.value=false;
    }
  }
  void clearCartLocal() {
    cartItems.clear();
  }

  Future<void> clearCartInSupabase() async {

    final String currentUserId = supabase.auth.currentUser!.id;

    try {

      await supabase
          .from('carts')
          .delete()
          .match({'user_id': currentUserId});

      print("Cart items cleared from Supabase for user: $currentUserId");

    } on PostgrestException catch (error) {
      print("Error clearing cart from Supabase: ${error.message}");

    }
  }
}



