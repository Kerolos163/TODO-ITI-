import 'package:flutter/material.dart';
import 'package:to_do/screens/get_start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF181818),
        appBarTheme: AppBarTheme(
          leadingWidth: 35,
          backgroundColor: Color(0XFF181818),
          titleTextStyle: TextStyle(color: Color(0XFFFFFCFC), fontSize: 20),
          iconTheme: IconThemeData(color: Color(0XFFFFFCFC)),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0XFF14B86B),
          selectionColor: Color.fromARGB(132, 20, 184, 108),
          selectionHandleColor: Color(0XFF14B86B),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Color(0xFF6D6D6D), fontSize: 16),
          contentPadding: EdgeInsets.all(12),
          filled: true,
          fillColor: Color(0XFF282828),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF15B86C),
            foregroundColor: Color(0XFFFFFCFC),
            fixedSize: Size(MediaQuery.of(context).size.width, 40),
            textStyle: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 24, color: Color(0XFFFFFCFC)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0XFFFFFCFC)),
          labelMedium: TextStyle(
            fontSize: 14,
            color: Color(0XFFC6C6C6),
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: GetStartScreen(),
    );
  }
}
