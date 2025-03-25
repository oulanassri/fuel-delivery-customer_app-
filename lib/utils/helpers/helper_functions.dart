import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../app/constants.dart';

class THelperFunctions {
/*  static Future<dynamic> suggestionAdress(String address) async {
    Response response = await Dio().get("https://photon.komoot.io/api/",
        queryParameters: {"q": address, "limit": 7});
    final json = response.data;
    return json;
  }*/
  static void showSnackBar({required String message, required String title}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          title,
          style: TextStyle().copyWith(
            fontSize: 18,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        messageText: Text(
          message,
          style: TextStyle().copyWith(
            fontSize: 18,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        backgroundColor: primaryColorSnackBar);
  }

  static void showAlert(String title, String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'))
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'ddd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
