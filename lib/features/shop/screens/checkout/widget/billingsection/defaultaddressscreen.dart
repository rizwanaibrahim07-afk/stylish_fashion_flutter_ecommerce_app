import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/size.dart';
import '../../../../../personalizations/models/addressmodel.dart';

class defaultaddress extends StatelessWidget {
  final AddressModel address;
  const defaultaddress({
    super.key, required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(padding: EdgeInsets.all(SSizes.defaultSpace/2),
      width: double.infinity,
      showborder: true,
      backgroundColor:Colors.transparent,
      borderColor:Colors.transparent,
      margin: const EdgeInsets.all(2),
      child: Stack(children: [



        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(address.name??'',maxLines: 1,style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: SSizes.sm/2,),
            Text(address.phoneNumber??'',maxLines:1,overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1)),
            const SizedBox(height: SSizes.sm/2,),
            Text('${address.houseName??''},${address.city??''},${address.state??''},'
                '${address.postalCode??''},${address.country??''}',
                  style  : Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1)
              ,maxLines:1,overflow: TextOverflow.ellipsis,)
          ],)
      ],),
    );
  }
}