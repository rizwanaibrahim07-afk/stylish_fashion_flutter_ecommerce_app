

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/personalizations/models/addressmodel.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../personalizations/controllers/addresscontroller.dart';
import '../model/order model.dart';
import '../model/orderitemmodel.dart';
import '../model/product_model.dart';
import 'cart_controller.dart';
import 'couponcntroller.dart';

class OrderController extends GetxController {

  static OrderController get instance => Get.find();

  final SupabaseClient supabase = Supabase.instance.client;
  final CartController cartController = Get.find<CartController>();
  var orders = <OrderModel>[].obs;
  var product = <ProductModel>[].obs;
  var isDetailLoading = false.obs;
var address=Rxn<AddressModel>();
  var isLoading = false.obs;
  void onInit(){
    fetchOrders();

    super.onInit();
  }
  Future<void> placeOrder() async {

    try {
      isLoading.value = true;
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) { Get.snackbar('Error', 'User not authenticated');
        return;
      }
      final cartItems = cartController.cartItems;
      if (cartItems.isEmpty) { Get.snackbar('Error', 'Cart is empty');
        return;
      }
      final String? addressId = await AddressController.instance.getDefaultaddressId();
      if (addressId == null) {
        Get.snackbar('Error', 'Default address not found.' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
        return;
       }
      final carttotal=cartController.calculateTotal;
      final totalamount = PromoController.instance.getFinalPrice(carttotal);
      final newOrder = await supabase.from('orders').
      insert([ { 'user_id': userId,
                 'totalamount': totalamount,
                  'status': 'processing',
                  'address_id':addressId, } ]).select();
      final orderId = newOrder[0]['id'];

      final List<Map<String, dynamic>> itemsToInsert = cartItems.map((item) {
        return Orderitems( order_id: orderId, product_id: item.productId,
          quantity: item.quantity, id: '',
          ).toJson(); }).toList();
      await supabase.from('ordereditems').insert(itemsToInsert);
      Get.snackbar('Success', 'Order placed successfully!' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
      cartController.clearCartInSupabase();
      cartController.clearCartLocal();
    }
    catch (e) {
      Get.snackbar('Error placing order', e.toString() ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
    }
    finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;
      final String? userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        print('DEBUG: User ID is null, cannot fetch orders.');
        return;
      }
      final List<dynamic> responseData = await supabase
          .from('orders')
          .select('*, ordereditems(*)')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      orders.value = responseData
          .map((json) => OrderModel.fromJson(json))
          .toList();

    } catch (e) {
      print('An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void>getAddressbyId(String addressId) async{
    try{
      final result=await supabase.from('user_addresses').select().eq('id',addressId).single();
      address.value=AddressModel.fromMap(result);
      print('fetched address:$result');
    }catch (e){
      print("error infetching address:$e");
    }
  }
  Future<void> fetchProducts(List<int> productIds) async {
    if (productIds.isEmpty) return;
    isDetailLoading.value = true;
    product.clear();
    try {

      final List<dynamic> data = await supabase
          .from('products')
          .select()
          .filter('id', 'in', '(${productIds.join(',')})');

      product.assignAll(data.map((e) => ProductModel.fromJson(e)).toList());

    } catch (e) {
      Get.snackbar('Error', 'Failed to load product details: $e' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
      print(e);
    } finally {
      isDetailLoading.value = false;
    }
  }
  void clearDetailProducts() {
    product.clear();

  }
}










