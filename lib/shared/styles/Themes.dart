// ignore_for_file: file_names

// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme= ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('2b2c2c'),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
      ),
      backgroundColor: Colors.black26,
      elevation: 0.0,
      iconTheme:IconThemeData(
        color: Colors.white,
      ) ,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.black26,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )),
  fontFamily:'Jannah',
) ;
ThemeData lightTheme= ThemeData(
  primarySwatch:defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme:IconThemeData(
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black45,
    backgroundColor: Colors.white54,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily:'Jannah',
) ;