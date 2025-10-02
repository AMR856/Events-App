import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    dividerTheme: DividerThemeData(
      color: ColorsManager.lightBlue,
      indent: 16.w,
      endIndent: 26.w,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: ColorsManager.lightBlue,
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.lightBlue
      )
    ),
    iconTheme: IconThemeData(
      color: ColorsManager.blueWhite,
    ),
    cardTheme: CardThemeData(
      color: ColorsManager.blueWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      )
    ),
    scaffoldBackgroundColor: ColorsManager.blueWhite,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        side: BorderSide(color: ColorsManager.lightBlue),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: ColorsManager.black1C,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorsManager.black1C,
      ),
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorsManager.lightBlue,
      ),
      titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: ColorsManager.blueWhite,
      ),
      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        color: ColorsManager.blueWhite,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: ColorsManager.lightBlue,
        titleTextStyle: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.lightBlue
        )
    ),
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.lightBlue, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.lightBlue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.white4F,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: ColorsManager.white4F,
      suffixIconColor: ColorsManager.white4F,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.lightBlue,
      indent: 16.w,
      endIndent: 26.w,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        side: BorderSide(color: ColorsManager.lightBlue),
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorsManager.white4F,
    ),
    cardTheme: CardThemeData(
        color: ColorsManager.darkBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r)
        )
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: ColorsManager.white4F,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorsManager.white4F,
      ),
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorsManager.lightBlue,
      ),
      titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: ColorsManager.white4F,
      ),
      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        color: ColorsManager.white4F,
      ),
    ),
  );
}
