import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constant.dart';
import 'constants/preferences_manager.dart';
import 'constants/theme/dark_theme.dart';
import 'constants/theme/light_theme.dart';
import 'screens/get_start_screen.dart';
import 'screens/layout_screen.dart';
import 'state/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
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
      create: (context) => AppProvider()..getTheme(),
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
