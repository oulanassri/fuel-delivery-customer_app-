import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/custom_app_bar.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/previous_order.dart';
import 'orders_controller.dart';

class OrdersScreen extends StatelessWidget {
   OrdersScreen({Key? key}) : super(key: key);
  OrdersController controller = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
   // Get.put(OrdersController());
   // controller.getMyOrders();

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "الطّلبات",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradientColorBg,
        ),
        child: Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : controller.ordersListLength.value == 0
            ? Center(
          child: Text(
            "لا يوجد طلبات",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
            :SingleChildScrollView(
                child: Column(
                  spacing: defaultPadding,
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),

                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onLongPress: () {},
                            child: PreviousOrder(
                              ordersModel: controller.orders[index],
                            ),
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) =>
                        const Divider()),
                    SizedBox(
                      height: defaultPadding,
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
