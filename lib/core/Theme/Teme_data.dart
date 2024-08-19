import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardColor: AppColors.white,
    indicatorColor: AppColors.black,
    shadowColor: Colors.black.withOpacity(0.2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.primaryColor,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
    primaryColor: AppColors.primaryColor, // Change primary color as needed
    // Change accent color as needed
    textTheme: TextTheme(
        bodySmall: Styles.textStyle12Blue,
        displayLarge: Styles.textStyle32Blue,
        displayMedium: Styles.textStyle18Black,
        bodyLarge: Styles.textStyle12Black,
        bodyMedium: Styles.textStyle12BoldGrey,
        titleMedium: const TextStyle(color: Colors.black),
        titleSmall: Styles.textStyle12Black,
        displaySmall: Styles.textStyle20Black,
        headlineMedium: Styles.textStyle14Grey,
        headlineSmall: Styles.textStyle14Blck,
        titleLarge: Styles.textStyle24BoldBlack,
        labelLarge: Styles.textStyle16White,
        labelMedium: Styles.textStyle16Black,
        headlineLarge: Styles.textStyle16Black

        // Text color for light mode
        ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
            color: AppColors.white), // Border color for light mode
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
  );

  static ThemeData darkTheme = ThemeData(
    indicatorColor: AppColors.white,

    cardColor: Colors.grey[900],
    shadowColor: Colors.white.withOpacity(0.1),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.primaryColor,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: AppColors.black,

    primaryColor: AppColors.primaryColor, // Change primary color as needed
    textTheme: TextTheme(
        bodySmall: Styles.textStyle12White,
        displayLarge: Styles.textStyle32Blue,
        displayMedium: Styles.textStyle18White,
        bodyLarge: Styles.textStyle12White,
        bodyMedium: Styles.textStyle12BoldGrey,
        titleMedium: const TextStyle(color: Colors.white),
        titleSmall: Styles.textStyle12White,
        displaySmall: Styles.textStyle20BoldWhite,
        headlineMedium: Styles.textStyle14Grey,
        headlineSmall: Styles.textStyle14White,
        titleLarge: Styles.textStyle14White,
        labelLarge: Styles.textStyle16Black,
        labelMedium: Styles.textStyle16White,
        headlineLarge: Styles.textStyle16White

        // Text color for light mode
        ),
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.black,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
            color: AppColors.white), // Border color for dark mode
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
  );
}
