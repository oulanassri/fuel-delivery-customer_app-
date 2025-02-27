import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  RxString activeOrderStatus =
      "ontheway" //ontheway  arrivedlocation  startservicing
          .obs;

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
            Text(
              "رقم الطلب: 22",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
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
                children: [
                  CustomTimeLineItem(
                    isFirst: true,
                    isPast: false,
                    isLast: false,
                    isCompleted: true,
                    status: 'تمّ قبول طلبك',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description:
                        'تمّ الموافقة على طلبك و الشّاحنة بالطّريق إليك',
                  ),
                  CustomTimeLineItem(
                    isFirst: false,
                    isPast: false,
                    isLast: false,
                    isCompleted: true,
                    status: 'الشّاحنة بالطريق إليك',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description: 'الوقت المتبقّّي:12 دقيقة',
                  ),
                  CustomTimeLineItem(
                      isFirst: false,
                      isPast: false,
                      isLast: false,
                      isCompleted: true,
                      status: 'تمّ وصول الشّاحنة',
                      date: 'Feb 10, 2025 - 10:00AM',
                      description: 'هذا رمز المصادقة 1225 قم بإعطاءه للسائق'),
                  CustomTimeLineItem(
                      isFirst: false,
                      isPast: false,
                      isLast: false,
                      isCompleted: true,
                      status: 'تمت عمليّة المصادقة',
                      date: 'Feb 10, 2025 - 10:00AM',
                      description: 'يتم الآن تعبئة الوقود'),
                  CustomTimeLineItem(
                    isFirst: false,
                    isPast: false,
                    isLast: true,
                    isCompleted: false,
                    status: 'تم إنهاء التعبئة',
                    date: 'Feb 10, 2025 - 10:00AM',
                    description: 'قم بدفع الفاتورة',
                  ),
                ],
              ),
            ),
            SizedBox(
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
                    style: Theme.of(context).textTheme.titleLarge,
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "223344",
                            style: Theme.of(context).textTheme.titleMedium,
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              "المدينة + الحيّ + تفاصيل عن الموقع تفاصيل عن الموقع",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultPadding * 2,
            ),
          ],
        ),
      ),
    );
  }
}
