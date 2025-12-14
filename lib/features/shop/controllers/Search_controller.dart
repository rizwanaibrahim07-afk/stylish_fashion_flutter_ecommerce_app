import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class SearchProductController extends GetxController {
  RxString searchQuery = ''.obs;
  RxList<ProductModel> searchResults = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
void init(){
  super.onInit();
}
  Future<void> performSearch(String query) async {
    isLoading.value = true;
    searchQuery.value = query;
    try {

      final response = await Supabase.instance.client
          .from('product')
          .select()
          .ilike('title', '%$query%');

      if (response != null && response is List) {
        searchResults.value = response.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        searchResults.clear();
      }
    } catch (e) {
      print('Error during search: $e');
      searchResults.clear();
    } finally {
      isLoading.value = false;
    }
  }
}