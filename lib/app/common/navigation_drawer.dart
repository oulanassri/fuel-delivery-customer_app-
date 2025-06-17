import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../home/home_controller.dart';
import '../orders/orders_controller.dart';
import '../properties/properties_controller.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: white,
        child: ListView(
          children: [
            buildDrawerHeader(context),
            Divider(
              color: Colors.grey,
            ),
            buildDrawerItem(
              icon: Icons.home,
              text: "الواجهة الرّئيسيّة",
              onTap: () => navigate(0),
              tileColor:
                  Get.currentRoute == Routes.HOME ? secondaryColor : null,
              textIconColor: Get.currentRoute == Routes.HOME
                  ? secondaryColor
                  : Colors.black,context: context
            ),
            buildDrawerItem(
              icon: Icons.wallet,
              text: "المحفظة",
              onTap: () => navigate(1),
              tileColor:
                  Get.currentRoute == Routes.WALLET ? secondaryColor : null,
              textIconColor: Get.currentRoute == Routes.WALLET
                  ? secondaryColor
                  : Colors.black,context: context
            ),
            buildDrawerItem(
                icon: Maki.fuel,
                text: "الطّلبات",
                onTap: () => navigate(2),
                tileColor:
                    Get.currentRoute == Routes.ORDERS ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.ORDERS
                    ? secondaryColor
                    : Colors.black,context: context),
            buildDrawerItem(
                icon: Icons.person,
                text: "الملف الشّخصي",
                onTap: () => navigate(3),
                tileColor:
                    Get.currentRoute == Routes.PROFILE ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.PROFILE
                    ? secondaryColor
                    : Colors.black,context: context),
            buildDrawerItem(
                icon: IcoFontIcons.searchProperty,
                text: "الممتلكات",
                onTap: () => navigate(4),
                tileColor: Get.currentRoute == Routes.PROPERTIES
                    ? secondaryColor
                    : null,
                textIconColor: Get.currentRoute == Routes.PROPERTIES
                    ? secondaryColor
                    : Colors.black,context: context),
            buildDrawerItem(
                icon: Icons.settings,
                text: "الإعدادات",
                onTap: () => navigate(5),
                tileColor:
                    Get.currentRoute == Routes.SETTINGS ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.SETTINGS
                    ? secondaryColor
                    : Colors.black, context: context),
            buildDrawerItem(
                icon: Icons.logout,
                text: "تسجيل خروج",
                onTap: () => navigate(6),
                tileColor: secondaryColor ,
                textIconColor: secondaryColor
                    , context: context),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader(BuildContext context) {
    final String initial = _getInitial(UserStorage.read("name")??"--");
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: primaryColor),
      accountName: Text(UserStorage.read("name")??"--"),
      accountEmail: Text(UserStorage.read("email")??"--"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: white,
        child: Text(
          initial,
          style: const TextStyle(
            fontSize: 40,
            color: secondaryColor,
            fontFamily: 'Tajawal',
            fontWeight:FontWeight.bold
          ),
          textDirection: _isArabic(initial) ? TextDirection.rtl : TextDirection.ltr,
        ),
      ),
      currentAccountPictureSize: Size.square(72),
      otherAccountsPicturesSize: Size.square(50),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      HomeController controller = Get.put(HomeController());
      controller.onReady();
      Get.toNamed(Routes.HOME);

    } else if (index == 1) {
      Get.toNamed(Routes.WALLET);
    } else if (index == 2) {
      OrdersController controller = Get.put(OrdersController());

      controller.getMyOrders();
      Get.toNamed(Routes.ORDERS);
    }
    else if (index == 3) {
      Get.toNamed(Routes.PROFILE);
    }
    else if (index == 4) {
      PropertiesController controller = Get.put(PropertiesController());

      controller.getProperties();
      Get.toNamed(Routes.PROPERTIES);
    }
    else if (index == 5) {
      Get.toNamed(Routes.SETTINGS);
    }
    else if (index == 6) {
      UserStorage.delete('token');

      Get.offNamed(Routes.LOGIN);

    }
  }
  String _getInitial(String name) {
    if (name.trim().isEmpty) return '?';
    return name.trim()[0].toUpperCase();
  }
  bool _isArabic(String text) {
    if (text.isEmpty) return false;
    final codeUnit = text.codeUnitAt(0);
    return (codeUnit >= 0x0600 && codeUnit <= 0x06FF);
  }
}
