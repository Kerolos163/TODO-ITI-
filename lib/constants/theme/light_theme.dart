import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primaryContainer: Color(0xFFFFFFFF),
    secondary: Color(0xFF3A4640),
    onSurface: Color(0XFF6A6A6A),
  ),
  scaffoldBackgroundColor: Color(0xFFF6F7F9),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0XFF14B86B),
    selectionColor: Color.fromARGB(132, 20, 184, 108),
    selectionHandleColor: Color(0XFF14B86B),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF6F7F9),
    titleTextStyle: TextStyle(color: Color(0xFF161F1B), fontSize: 20),
    // centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFF161F1B)),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFF15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return 0;
      }
      return 2;
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Color(0XFF15B86C)),
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFCFC)),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(foregroundColor: WidgetStateProperty.all(Colors.black)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Color(0xFFFFFCFC),
    extendedTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 28, color: Color(0xFF3A4640)),
    titleMedium: TextStyle(fontSize: 20, color: Color(0xFF161F1B)),
    bodyLarge: TextStyle(fontSize: 24, color: Color(0xFF161F1B)),
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF161F1B)),
    headlineMedium: TextStyle(fontSize: 18, color: Color(0XFFFFFCFC)),
    labelMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFF3A4640),
      fontWeight: FontWeight.w300,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    focusColor: Color(0xFFD1DAD6),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
  ),

  iconTheme: IconThemeData(color: Color(0xFF161F1B)),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  dividerTheme: DividerThemeData(color: Color(0xFFD1DAD6)),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF6F7F9),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Color(0xFF3A4640),
    selectedItemColor: Color(0xFF14A662),
  ),
  splashFactory: NoSplash.splashFactory,
  popupMenuTheme: PopupMenuThemeData(
    color: Color(0xFFF6F7F9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 2,
    shadowColor: Color(0xFF15B86C),
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0XFF15BB6C);
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.transparent;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(4),
      side: BorderSide(width: 2),
    ),
  ),
);
