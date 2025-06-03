import 'package:flutter/material.dart';
import 'package:to_do/widgets/custom_svg_picture.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    this.trailing,
    required this.path,
    required this.title,
    this.onTap,
  });
  final String title;
  final String path;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      leading: CustomSvgPicture(path: path, withColorFilter: true),
      trailing: trailing,
    );
  }
}
