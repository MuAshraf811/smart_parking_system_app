import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../appconstance/app_constance.dart';

ThemeData themelight() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: AppConstance.defaultColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(foregroundColor: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppConstance.defaultColor,
      unselectedItemColor: Colors.grey[500],
      backgroundColor: Colors.white,
      elevation: 25,
    ),
    fontFamily: 'Janna',
  );
}

ThemeData themeDark() {
  return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.deepOrange),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 37, 35, 35),
      primarySwatch: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 37, 35, 35),
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 37, 35, 35),
            statusBarIconBrightness: Brightness.light,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        elevation: 25,
      ),
      fontFamily: 'Janna');
}
