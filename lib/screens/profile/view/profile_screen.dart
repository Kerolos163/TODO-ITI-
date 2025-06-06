import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constants/assets.dart';
import '../../../constants/constant.dart';
import '../../../constants/preferences_manager.dart';
import '../../UserDetails/View/user_details.dart';
import '../../get_start_screen.dart';
import '../state/profile_provider.dart';
import 'widget/profile_item.dart';
import '../../../state/app_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider()..getInfo(),
      child: Scaffold(
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
                    Consumer<ProfileProvider>(
                      builder: (context, profileProvider, child) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  profileProvider.profileImage != null
                                  ? FileImage(
                                      File(profileProvider.profileImage!),
                                    )
                                  : AssetImage(Assets.assetsImgsPerson),
                              radius: 60,
                            ),
                            GestureDetector(
                              onTap: () {
                                profileImage(
                                  context,
                                  profileProvider.saveImage,
                                );
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                ),
                                child: Icon(Icons.camera_alt, size: 26),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    Selector<ProfileProvider, String?>(
                      selector: (_, myType) => myType.name,
                      builder: (context, name, child) {
                        return Text(
                          name ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      },
                    ),
                    SizedBox(height: 4),
                    Selector<ProfileProvider, String?>(
                      selector: (_, myType) => myType.quote,
                      builder: (context, quote, child) {
                        return Text(
                          quote ?? "One task at a time. One step closer.",
                          style: Theme.of(context).textTheme.labelSmall,
                        );
                      },
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
              Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
                  return ProfileItem(
                    path: Assets.assetsImgsProfileIcon,
                    title: "User Details",
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () async {
                      final changedInfo = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetails()),
                      );
                      if (changedInfo != null && changedInfo) {
                        await profileProvider.getInfo();
                      }
                    },
                  );
                },
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
                onTap: () {
                  PreferencesManager.remove(Constant.nameKey);
                  PreferencesManager.remove(Constant.userTasks);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GetStartScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> profileImage(
    BuildContext context,
    Function(XFile) selectedFile,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Choose Image Source',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                XFile? image = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  selectedFile(image);
                }
              },
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.camera_alt),
                  SizedBox(width: 8),
                  Text('Camera'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                XFile? image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  selectedFile(image);
                }
              },
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.photo_library),
                  SizedBox(width: 8),
                  Text('Gallery'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
