import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/constants/preferences_manager.dart';
import 'package:to_do/constants/theme/dark_theme.dart';
import 'package:to_do/constants/theme/light_theme.dart';
import 'package:to_do/screens/get_start_screen.dart';
import 'package:to_do/screens/layout_screen.dart';
import 'package:to_do/state/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // PreferencesManager.clear();
  String? user = PreferencesManager.getString(Constant.nameKey);
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.user});
  final String? user;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),

      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: appProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
            home: user == null ? GetStartScreen() : LayoutScreen(),
          );
        },
      ),
    );
  }
}
