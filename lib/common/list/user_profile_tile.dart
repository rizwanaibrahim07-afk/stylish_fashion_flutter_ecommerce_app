import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/personalizations/controllers/profile_controller.dart';
import '../../utils/constants/image_string.dart';
import '../images/SCircularImage.dart';
class SUserProfiletile extends StatelessWidget {
 final ProfileController controller=Get.put(ProfileController());
 SUserProfiletile({
    super.key, required this.onPressed,
  });
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {

    return Obx(()
      {
        final user=controller.profile.value;

        if(controller.isLoading.value){ return const CircularProgressIndicator();}
        return ListTile(leading:  SCircularImage(isNetworkImage:controller.avatarUrl.value.isNotEmpty ,
          image:controller.avatarUrl.value.isNotEmpty
            ? controller.avatarUrl.value
            : 'assets/images/user/user1.jpg',
            height: 60,width: 60,padding:EdgeInsets.all(0),),
          title: Text(user?.userName??'',style: Theme.of(context).textTheme.labelMedium!.apply(color:Colors.white ),),
          subtitle:Text(user?.email??'',
            style: Theme.of(context).textTheme.labelSmall!.apply(color:Colors.white ),maxLines: 1,overflow: TextOverflow.ellipsis,),
          trailing: IconButton(onPressed: onPressed, icon:Icon(Icons.edit),color: Colors.white,),
        );
        },
    );
  }
}