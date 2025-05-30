import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/constants/theme/dark_theme.dart';
import 'package:to_do/constants/theme/light_theme.dart';
import 'package:to_do/screens/get_start_screen.dart';
import 'package:to_do/screens/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  String? user = prefs.getString(Constant.nameKey);
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.user});
  final String? user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: user == null ? GetStartScreen() : LayoutScreen(),
    );
  }
}
