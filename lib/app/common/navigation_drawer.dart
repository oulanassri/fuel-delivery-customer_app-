import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../routes/app_routes.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: white,
        child: ListView(
          children: [
            buildDrawerHeader(),
            Divider(
              color: Colors.grey,
            ),
            buildDrawerItem(
              icon: Icons.home,
              text: "Home",
              onTap: () => navigate(0),
              tileColor:
                  Get.currentRoute == Routes.HOME ? secondaryColor : null,
              textIconColor: Get.currentRoute == Routes.HOME
                  ? secondaryColor
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.wallet,
              text: "My Wallet",
              onTap: () => navigate(1),
              tileColor:
                  Get.currentRoute == Routes.WALLET ? secondaryColor : null,
              textIconColor: Get.currentRoute == Routes.WALLET
                  ? secondaryColor
                  : Colors.black,
            ),
            buildDrawerItem(
                icon: Maki.fuel,
                text: "My Orders",
                onTap: () => navigate(2),
                tileColor:
                    Get.currentRoute == Routes.ORDERS ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.ORDERS
                    ? secondaryColor
                    : Colors.black),
            buildDrawerItem(
                icon: Icons.person,
                text: "My Profile",
                onTap: () => navigate(3),
                tileColor:
                    Get.currentRoute == Routes.PROFILE ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.PROFILE
                    ? secondaryColor
                    : Colors.black),
            buildDrawerItem(
                icon: IcoFontIcons.searchProperty,
                text: "My Properties",
                onTap: () => navigate(4),
                tileColor: Get.currentRoute == Routes.PROPERTIES
                    ? secondaryColor
                    : null,
                textIconColor: Get.currentRoute == Routes.PROPERTIES
                    ? secondaryColor
                    : Colors.black),
            buildDrawerItem(
                icon: Icons.settings,
                text: "Settings",
                onTap: () => navigate(5),
                tileColor:
                    Get.currentRoute == Routes.SETTINGS ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.SETTINGS
                    ? secondaryColor
                    : Colors.black),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: primaryColor),
      accountName: Text("username"),
      accountEmail: Text("email"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: white,
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
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.toNamed(Routes.WALLET);
    } else if (index == 2) {
      Get.toNamed(Routes.ORDERS);
    }
    else if (index == 3) {
      Get.toNamed(Routes.PROFILE);
    }
    else if (index == 4) {
      Get.toNamed(Routes.PROPERTIES);
    }
    else if (index == 5) {
      Get.toNamed(Routes.SETTINGS);
    }
  }
}
