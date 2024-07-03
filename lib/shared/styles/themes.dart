import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/colors.dart';



ThemeData myLightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepPurple,
  iconTheme: IconThemeData(
    color: DARKCOLOR,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,


    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: mainColor,
      statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark


    ),
    elevation: 0,
    backgroundColor: mainColor,
    foregroundColor: sugarColor,
    titleTextStyle: GoogleFonts.cairo(
      color: whiteColor,
      fontSize: 25,
      //fontWeight: FontWeight.bold


    ),
    iconTheme: IconThemeData(
        color: whiteColor,

    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: mainColor,
    unselectedItemColor: DARKCOLOR,
    selectedItemColor: sugarColor,
  ),
    bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart:Radius.circular(30),
              topEnd:Radius.circular(30),
            )
        ),
        backgroundColor: mainColor
    ),

    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     elevation: 5,
    //
    //   )
    // ),
    drawerTheme: DrawerThemeData(
      backgroundColor: whiteColor.withOpacity(.8),
      elevation: 0,

    ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.cairo(
      fontSize: 19,
      color: DARKCOLOR,
      height: 1.2,
    ),
    bodySmall: GoogleFonts.cairo(
      fontSize: 19,
      height: 1.2,
    )
    // TextStyle(

    //   //fontFamily: myFont,
    //
    // ),
)
);





ThemeData myDarkTheme = ThemeData(
  //fontFamily: myFont,
  scaffoldBackgroundColor: DARKBACKGROUND,
  primarySwatch: Colors.deepPurple,
  iconTheme: IconThemeData(
    color: whiteColor,
  ),
  appBarTheme: AppBarTheme(
   // centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: DARKBACKGROUND,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light

    ),
    elevation: 0,

    backgroundColor:DARKBACKGROUND,
    foregroundColor: DARKCOLOR,
    titleTextStyle: TextStyle(
      color: whiteColor,
      //fontFamily: myFont,
      fontWeight: FontWeight.bold
    ),

    iconTheme: IconThemeData(color: whiteColor),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    backgroundColor: mainColor,
    unselectedItemColor: DARKCOLOR,
    selectedItemColor:sugarColor ,
  ),

    bottomSheetTheme: BottomSheetThemeData(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart:Radius.circular(30),
              topEnd:Radius.circular(30),
            )
        ),
        backgroundColor: mainColor,

    ),
  // drawerTheme: DrawerThemeData(
  //   backgroundColor: DARKCOLOR.withOpacity(.9),
  //   elevation: 0,
  // ),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.cairo(
            fontSize: 19,
            color: whiteColor,
            height: 1.2
        )
      // TextStyle(

      //   //fontFamily: myFont,
      //
      // ),
    )


  );


