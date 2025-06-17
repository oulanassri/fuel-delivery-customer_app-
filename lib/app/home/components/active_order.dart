
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../generated/assets.dart';
import '../../../models/truck_order_model.dart';
import '../../../routes/app_routes.dart';
import '../../auth/components/custom_material_button.dart';
import '../../common/common_material_button.dart';
import '../../common/custom_text_form_field1.dart';
import '../../constants.dart';
import '../../common/invoice_table.dart';
import '../home_controller.dart';
import 'custom_time_line_item.dart';

class ActiveOrder extends StatelessWidget {
  HomeController controller;
  /*RxString activeOrderStatus =
      "ontheway" //ontheway  arrivedlocation  startservicing
          .obs;*/

  ActiveOrder({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: defaultPadding,
            ),
            /*  Text(
              "رقم الطلب: ${controller.truckOrderModel.}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: defaultPadding,
            ),*/
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(defaultPadding),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: Column(
                children: [
                  CustomTimeLineItem(
                    isFirst: true,
                    isPast: false,
                    isLast: false,
                    isCompleted: controller.orderStatusId.value >= 0,
                    status: 'طلبك قيد الانتظار',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description: 'جار البحث عن شّاحنة بالقرب منك',
                    image: Assets.imagesAddOrder,
                  ),
                  CustomTimeLineItem(
                    isFirst: false,
                    isPast: false,
                    isLast: false,
                    isCompleted: controller.orderStatusId.value >= 1,
                    status: 'تمّ قبول طلبك',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description:
                    'تمّ الموافقة على طلبك و الشّاحنة بالطّريق إليك',
                    image: Assets.imagesOntheway,
                  ),
                  CustomTimeLineItem(
                    isFirst: false,
                    isPast: false,
                    isLast: false,
                    isCompleted:  controller.orderStatusId.value >=2,
                    status: 'تمّ وصول الشّاحنة',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description: 'هذا رمز المصادقة 1225 قم بإعطاءه للسائق',
                    image: Assets.imagesArrivedTruck,
                  ),
                  CustomTimeLineItem(
                    isFirst: false,
                    isPast: false,
                    isLast: false,
                    isCompleted: controller.orderStatusId.value >= 3,
                    status: 'تمت عمليّة المصادقة',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description: 'يتم الآن تعبئة الوقود',
                    image: Assets.imagesStart,
                  ),

                  CustomTimeLineItem(
                    isFirst: false,
                    isPast: false,
                    isLast: true,
                    isCompleted: controller.orderStatusId.value >= 4,
                    status: 'تم إنهاء التعبئة',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description: 'قم بدفع الفاتورة',
                    image: Assets.imagesOrderDone,
                  ),
                ],
              ),
            ),
           /* SizedBox(
              height: defaultPadding,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(defaultPadding),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تفاصيل الطلب",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(defaultPadding * 3 / 4),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.local_shipping_rounded),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "رقم اللّوحة:",
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelMedium,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "223344",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Divider(),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(defaultPadding * 3 / 4),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.location_on_outlined),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "موقع الشّاحنة:",
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelMedium,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              "المدينة + الحيّ + تفاصيل عن الموقع تفاصيل عن الموقع",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),*/
            SizedBox(
              height: defaultPadding * 2,
            ),
        /*    StreamBuilder(
                stream: controller.streamController.stream,
                builder: (context, snapdata) {
                  switch (snapdata.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:if(snapdata.hasError){
                      return Text("please wait....");
                    }else{
                      return BuildOrderStatus(snapdata.data);
                    }

                  }
                }),*/
          ],
        ),
      ),
    );
  }
  Widget BuildOrderStatus(TruckOrderModel truckOrderModel){
    return Text(truckOrderModel.status??"");
  }
}
