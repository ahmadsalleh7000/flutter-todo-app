import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/utils/colors.dart';

class LightTheme {
  
  static final ThemeData lightTheme = ThemeData(
    primaryColor           : APPColors.lightPrimaryColor,
    scaffoldBackgroundColor: APPColors.lightBackgroundColor,
    appBarTheme            : const AppBarTheme(
      backgroundColor      : APPColors.lightPrimaryColor,
      elevation            : 0,
    ),
    textTheme              :  TextTheme(
      titleLarge           : GoogleFonts.poppins(
        fontSize           : 22,
        fontWeight         : FontWeight.bold,
        color              : APPColors.whiteColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize           : 18,
        fontWeight         : FontWeight.bold,
        color              : APPColors.blackColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize           : 20,
        fontWeight         : FontWeight.w500,
        color              : APPColors.blackColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize           : 18,
        fontWeight         : FontWeight.w400,
        color              : APPColors.blackColor,
      ),
    ),
    bottomNavigationBarTheme  : const BottomNavigationBarThemeData(
      selectedItemColor       : APPColors.lightPrimaryColor,
      unselectedItemColor     : APPColors.grayColor,
      backgroundColor         : Colors.transparent,
      elevation               : 0,
    ),
    floatingActionButtonTheme :  FloatingActionButtonThemeData(
      backgroundColor         : APPColors.lightPrimaryColor,
      foregroundColor         : APPColors.whiteColor,
      shape                   : RoundedRectangleBorder(
        side                  : const BorderSide(color: APPColors.whiteColor, width: 6), 
        borderRadius          : BorderRadius.circular(50)),
      elevation               : 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    )
  );
}