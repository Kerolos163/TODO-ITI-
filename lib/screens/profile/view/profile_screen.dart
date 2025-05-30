import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants/assets.dart';
import 'package:to_do/state/app_provider.dart';
import 'package:to_do/widgets/custom_svg_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.assetsImgsPerson),
                        radius: 60,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Icon(Icons.camera_alt, size: 26),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Usama Elgendy",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "One task at a time. One step closer.",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            Text(
              'Profile Info',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            ProfileItem(
              path: Assets.assetsImgsProfileIcon,
              title: "User Details",
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(color: Theme.of(context).colorScheme.secondary),
            ProfileItem(
              path: Assets.assetsImgsDarkModeProfile,
              title: "Dark Mode",
              trailing: Consumer<AppProvider>(
                builder: (context, appProvider, child) {
                  return Switch(
                    value: appProvider.darkMode,
                    onChanged: (value) => appProvider.changeMode(value),
                  );
                },
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.secondary),
            ProfileItem(
              path: Assets.assetsImgsLogOut,
              title: "Log Out",
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    this.trailing,
    required this.path,
    required this.title,
  });
  final String title;
  final String path;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      leading: CustomSvgPicture(path: path, withColorFilter: true),
      trailing: trailing,
    );
  }
}
