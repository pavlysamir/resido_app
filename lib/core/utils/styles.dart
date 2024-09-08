import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resido_app/core/utils/app_colors.dart';

abstract class Styles {
  static TextStyle textStyle20BoldPoppings = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyle32Black = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle textStyle18Black = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
  static TextStyle textStyle18White = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle32White = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle32Blue = GoogleFonts.almarai(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  // static TextStyle? textStyle32Black;
  // void initializeTextStyle32Black() {
  //   textStyle32Black = TextStyle(
  //     fontSize: 32.sp,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.black,
  //   );
  // }
  static TextStyle textStyle12Black = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black);
  static TextStyle textStyle12White = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle textStyle12BoldGrey = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey);

  static TextStyle textStyle12Blue = GoogleFonts.almarai(
      fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.black);

  static TextStyle textStyle12WhiteBoldPoppings = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle textStyle12Orange = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryColor);

  static TextStyle textStyle24BoldBlack = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
  static TextStyle textStyle24Black = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle textStyle24BoldWhite = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle20Black = GoogleFonts.poppins(
    fontSize: 20,
    color: AppColors.black,
  );
  static TextStyle textStyle20BoldWhite = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle textStyle14Grey = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle textStyle14Blck = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle textStyle14White = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);

  static TextStyle textStyle14 = GoogleFonts.almarai(
      fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.black);

  // const TextStyle(
  //     fontSize: 14, fontWeight: FontWeight.bold, color: kPrimaryKey);

  static TextStyle textStyle16Black = GoogleFonts.almarai(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
  // contact us
  static TextStyle textStyle16Grey = GoogleFonts.almarai(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );
  static TextStyle textStyle16White = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);
  static TextStyle textStyle18BoldPrimary = GoogleFonts.almarai(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle textStyleDarkGrey = GoogleFonts.almarai(
    fontSize: 14, // Adjust the font size as needed
    fontWeight: FontWeight.normal, // Adjust the font weight as needed
    color: AppColors.darkGrey,
  );
}
