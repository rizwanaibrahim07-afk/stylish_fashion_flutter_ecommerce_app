
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/screens/order/widgets/orderdetailscreen.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../../controllers/ordercontoller.dart';

class OrderListItems extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());
   OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Obx(() {
          if (
          controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.orders.isEmpty) {
            return Center(child: Text("No Orders Found."));
          }

          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => SizedBox(height: SSizes.spaceBtwItem),
            itemCount: controller.orders.length,
            itemBuilder: (_, index) {
              final order = controller.orders[index];

              return SRoundedContainer(
                padding: EdgeInsets.all(2),
                width: MediaQuery.of(context).size.width,
                showborder: true,
                backgroundColor: dark ? SColors.dark : SColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_shipping, color: SColors.primary),
                            SizedBox(width: SSizes.spaceBtwItem / 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.status.name.toUpperCase(),
                                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                                      color: SColors.primary, fontWeightDelta: 1),
                                ),
                                Text(
                                  '${order.created_at.toString().substring(0, 10)}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ],
                        ),
                        IconButton(onPressed: () {Get.to(()=>Orderdetailscreen(), arguments: order);}, icon: Icon(Icons.arrow_right)),
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwItem),


                    Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Icon(Icons.card_giftcard),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order ID',
                                    style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1),
                                  ),
                                  Text(
                                    '#${order.id}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.calendar_today),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1, overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    '${order.delivery_date.toString().substring(0, 10)}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwItem),


                    Text(
                      'Items (${order.items.length}):',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: SSizes.spaceBtwItem / 2),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: order.items.length,
                      itemBuilder: (context, itemIndex) {
                        final item = order.items[itemIndex];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Product ID: ${item.product_id}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Qty: ${item.quantity}',
                                style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // --- END ADDED SECTION ---

                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}


