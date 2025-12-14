import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../../controllers/addresscontroller.dart';
import '../../../models/addressmodel.dart';
class SSingleAddress extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onSetDefault;
  final VoidCallback onDelete;

  final controller=Get.find<AddressController>();
   SSingleAddress({super.key, required this.address, required this.onSetDefault, required this.onDelete});

  @override
  Widget build(BuildContext context) {

    final dark=SHelperFunctions.isDarkMode(context);
    return GestureDetector(onTap: onSetDefault,
      child: SRoundedContainer(padding: EdgeInsets.all(SSizes.defaultSpace/2),
                width: double.infinity,
                showborder: true,
                backgroundColor: address.isDefault?SColors.primary.withAlpha(90):Colors.transparent,
                borderColor:address.isDefault?Colors.transparent: dark
                    ?SColors.darkGrey:SColors.grey,
                margin: const EdgeInsets.all(SSizes.spaceBtwItem),
                child: Stack(children: [


                  Positioned(right:-2,bottom: -15,
                      child: IconButton(icon:Icon(Icons.delete_outline_outlined),
                        color:Colors.red, onPressed: () =>onDelete)

                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(address.name??'',maxLines: 1,style: Theme.of(context).textTheme.labelLarge,),
                      const SizedBox(height: SSizes.sm/4,),
                      Text(address.phoneNumber??'',maxLines:1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(height: SSizes.sm/4,),
                      Text('${address.houseName??''},${address.city??''},${address.state??''},'
                          '${address.postalCode??''},${address.country??''}',style: Theme.of(context).textTheme.labelMedium,maxLines:1,overflow: TextOverflow.ellipsis,)
                    ],)
                ],),
              ),
    );
        }

  }

