import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/assets.dart';
import 'completedScreen/view/completed_screen.dart';
import 'myTasksScreen/view/my_tasks_screen.dart';
import 'profile/view/profile_screen.dart';
import 'toDoScree/view/to_do_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [
    MyTasksScreen(),
    ToDOScreen(),
    CompletedScreen(),
    ProfileScreen(),
  ];
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
        onTap: (value) {
          setState(() {
            _currentScreen = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsImgsHomeIcon,
              colorFilter: ColorFilter.mode(
                _currentScreen == 0 ? Color(0XFF15BB6C) : Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsImgsToDoIcon,
              colorFilter: ColorFilter.mode(
                _currentScreen == 1 ? Color(0XFF15BB6C) : Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsImgsCompleteIcon,
              colorFilter: ColorFilter.mode(
                _currentScreen == 2 ? Color(0XFF15BB6C) : Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsImgsProfileIcon,
              colorFilter: ColorFilter.mode(
                _currentScreen == 3 ? Color(0XFF15BB6C) : Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
