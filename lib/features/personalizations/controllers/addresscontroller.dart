import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stylish_fashion/data/repositories/addressrepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import '../models/addressmodel.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
final AddressRepository _addressRepository=AddressRepository();
  final RxList<AddressModel> addresses = <AddressModel>[].obs;
final nameController=TextEditingController();
  final phnumberController=TextEditingController();
  final houseNameController=TextEditingController();
  final cityController=TextEditingController();
  final postalController=TextEditingController();
  final stateController=TextEditingController();
  final countryController=TextEditingController();
  RxBool loading=false.obs;
  final supabase=Supabase.instance.client;

  @override
  void onInit(){
    fetchAddresses();
    super.onInit();
  }

  Future<void> fetchAddresses()  async {
    final user=supabase.auth.currentUser;
    try {
      loading.value = true;
if(user!=null){
  final list =await _addressRepository.getAddresses(user.id);
  addresses.assignAll(list);
}


    } catch (e) {
      print('Error:$e');
    }
    finally {
      loading.value = false;
    }
  }

    Future<void> addAddress() async {
      try {
        loading.value=true;
        await _addressRepository.addAddress({'name':nameController.text.trim()??'',
          'phoneNumber':phnumberController.text.trim()??'','houseName':houseNameController.text.trim()??''
        ,'state':stateController.text.trim()??'','country':countryController.text.trim()??'','city':cityController.text.trim()??'',
        'postalCode':postalController.text.trim()??'',});

         nameController.clear();
         phnumberController.clear();
         postalController.clear();
         cityController.clear();
         countryController.clear();
         stateController.clear();
         houseNameController.clear();
          fetchAddresses(); // Refresh the list after adding
          Get.snackbar('Success', 'Address added successfully!' ,snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.all(10),borderRadius: 8);

      } catch (e) {
        Get.snackbar('Error', e.toString() ,snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),borderRadius: 8);
      }finally{
        loading.value=false;
      }
    }


    Future<void> deleteAddresses(String id)  async {
    loading.value=true;
    await _addressRepository.deleteAddresses(id);
    await fetchAddresses();
    loading.value=false;
  }
  Future<void> setDefault(String addressId) async {
    try {
    loading.value=true;
    final user = supabase.auth.currentUser;

    if (user == null) {
      Get.snackbar('Error', 'User not authenticated.' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
      return;
    }
    final currentDefaultId = addresses.firstWhereOrNull((addr) => addr.isDefault)?.id;
    if (currentDefaultId == addressId) {
      return;
    }
    final currentDefault = addresses.firstWhereOrNull((addr) => addr.isDefault);

    if (currentDefault?.id == addressId) {
      return;
    }
    await _addressRepository.updateDefaultStatus(
      userId: user.id,
      newDefaultAddressId: addressId,
      oldDefaultAddressId: currentDefault?.id,
    );
    await fetchAddresses();

    Get.snackbar('Success', 'Default address set.' ,snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),borderRadius: 8);
    } catch (e) {
      print('Error setting default address: $e');
      Get.snackbar('Error', 'Failed to set default address: $e' ,snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),borderRadius: 8);
    }finally {
      loading.value = false;
    }
  }

  AddressModel? get defaultAddress {
    // firstWhereOrNull is a GetX extension that returns null if no match is found,
    // which prevents errors if no address is default yet.
    return addresses.firstWhereOrNull((addr) => addr.isDefault);
  }
  Future<String?> getDefaultaddressId() async{
    final userId=supabase.auth.currentUser!.id;
    final res=await supabase.from('user_addresses').select('id').eq('userId',userId).eq('isDefault',true).maybeSingle();
    if(res==null)return null;
    return res['id'];
}
}
