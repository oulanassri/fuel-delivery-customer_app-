import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.bold,
      color: primaryText,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
      color: primaryText,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
      color: secondaryText,
    ),
    ///////////////  title   ///////////////
    titleLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
      color: primaryText,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w500,
      color: primaryText,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w400,
      color: primaryText,
    ),

    ///////////////  body   ///////////////
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w500,
      color: primaryText,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.bold,
      color: secondaryText,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w500,
      color: primaryText.withOpacity(0.5),
    ),
    ///////////////  label   ///////////////
    labelLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.normal,
      color: primaryText,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.normal,
      color: primaryText.withOpacity(0.5),
    ),
  );
/* static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    ///////////////  title   ///////////////
    titleLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    ///////////////  body   ///////////////
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.5),
    ),
    ///////////////  label   ///////////////
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.5),
    ),
  );*/
}
