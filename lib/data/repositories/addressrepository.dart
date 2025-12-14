import 'package:stylish_fashion/features/personalizations/models/addressmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddressRepository{
  final supabase=Supabase.instance.client;

  Future<List<AddressModel>> getAddresses(String userId)async{

    final response=await supabase.from('user_addresses').select().eq('userId',userId).order('created_at',ascending: false);
    return response.map((e)=>AddressModel.fromMap(e)).toList();

  }

Future<void> addAddress(Map<String,dynamic> data) async{
    final user=supabase.auth.currentUser;
    final response=await supabase.from('user_addresses').insert({'userId':user!.id,...data,});
    print('fetched:$response');
  }
  Future<void> deleteAddresses(String id) async{
    await supabase.from('user_addresses').delete().eq('id',id);
  }
  Future<void> updateDefaultStatus({
    required String userId,
    required String newDefaultAddressId,
    String? oldDefaultAddressId,
  }) async {
    if (oldDefaultAddressId != null && oldDefaultAddressId.isNotEmpty) {
      await supabase
          .from('user_addresses')  .update({'isDefault': false})
          .eq('id', oldDefaultAddressId)
          .eq('userId', userId);
    }
    await supabase
        .from('user_addresses')
        .update({'isDefault': true}) .eq('id', newDefaultAddressId)
        .eq('userId', userId);
  }
}


