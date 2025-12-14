
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class WishlistController extends GetxController {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final RxList<ProductModel> wishlistProducts = <ProductModel>[].obs; // Stores product IDs in wishlist



  @override
  void onInit() {
    super.onInit();
    fetchUserWishlist();
  }
Future<void> Remove(int productId)async {
  final userId = _supabaseClient.auth.currentUser?.id;
  if (userId == null) return;

   await _supabaseClient
        .from('wishlist')
        .delete()
        .eq('user_id', userId)
        .eq('product_id', productId);

  }
  Future<void> fetchUserWishlist() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) return;

      final response = await _supabaseClient
          .from('wishlist')
          .select('product_id,products(*)')
          .eq('user_id', userId);


        wishlistProducts.value=response.map((row)=>ProductModel.fromJson(row['products'])).toList();


    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
    }
  }

  Future<void> toggleWishlist(ProductModel product) async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) return;

      if (isProductInWishlist(product.id)) {
        // Remove from wishlist
        await _supabaseClient
            .from('wishlist')
            .delete()
            .eq('user_id', userId)
            .eq('product_id', product.id);
        wishlistProducts.removeWhere((p)=>p.id==product.id);
        Get.snackbar('Success', 'Removed from wishlist!' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      } else {
        // Add to wishlist
        await _supabaseClient
            .from('wishlist')
            .insert({'user_id': userId, 'product_id': product.id});
        wishlistProducts.add(product);
        Get.snackbar('Success', 'Added to wishlist!' ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update wishlist: $e');
    }
  }

  bool isProductInWishlist(int productId) {
    return wishlistProducts.any((p)=>p.id==productId);
  }
  Future<List<ProductModel>> fetchAllWishlistItems() async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) return [];

    try {
      final List<dynamic> data = await _supabaseClient
          .from('wishlist')
          .select('products ( id, title,  imageUrl)')
          .eq('user_id', userId);

      // Map the nested product data to the Product model
      return data.map((item) => ProductModel.fromJson(item['products'])).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load wishlist items: $e' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
      return [];
    }
  }
    }
