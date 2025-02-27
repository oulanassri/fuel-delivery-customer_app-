import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradientColorAppBarBg),
      child: AppBar(iconTheme: IconThemeData(color: white),
        //  backgroundColor: Colors.grey,
        //Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 150,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                primaryColor,
                primaryColor,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
