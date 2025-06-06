import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primaryContainer: Color(0xFF282828),
    secondary: Color(0XFFC6C6C6),
    onSurface: Color(0XFFFFFCFC),
    shadow: Color(0XFFFFFCFC),
  ),
  scaffoldBackgroundColor: Color(0xFF181818),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0XFF14B86B),
    selectionColor: Color.fromARGB(132, 20, 184, 108),
    selectionHandleColor: Color(0XFF14B86B),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF181818),
    titleTextStyle: TextStyle(color: Color(0xFFFFFCFC), fontSize: 20),
    // centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFFFFFCFC)),
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
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFCFC)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Color(0xFFFFFCFC),
    extendedTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 28, color: Colors.white),
    titleMedium: TextStyle(fontSize: 20, color: Color(0XFFFFFCFC)),
    bodyLarge: TextStyle(fontSize: 24, color: Color(0XFFFFFCFC)),
    bodyMedium: TextStyle(fontSize: 16, color: Color(0XFFFFFCFC)),
    displayMedium: TextStyle(fontSize: 16, color: Color(0xFF161F1B)),
    headlineMedium: TextStyle(fontSize: 18, color: Color(0XFFFFFCFC)),
    labelMedium: TextStyle(
      fontSize: 14,
      color: Color(0XFFC6C6C6),
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(fontSize: 14, color: Color(0XFFC6C6C6)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0xFF6D6D6D)),
    filled: true,
    fillColor: Color(0xFF282828),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red, width: 0.5),
    ),
  ),
  iconTheme: IconThemeData(color: Color(0xFFFFFCFC)),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFCFC),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  dividerTheme: DividerThemeData(color: Color(0xFF6E6E6E)),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF181818),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Color(0xFFC6C6C6),
    selectedItemColor: Color(0xFF15B86C),
  ),
  splashFactory: NoSplash.splashFactory,
  popupMenuTheme: PopupMenuThemeData(
    color: Color(0xFF181818),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFF15B86C), width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 2,
    shadowColor: Color(0xFF15B86C),
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
