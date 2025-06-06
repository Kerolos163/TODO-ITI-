import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/assets.dart';
import '../constants/constant.dart';
import '../constants/extensions.dart';
import 'layout_screen.dart';
import '../widgets/custom_svg_picture.dart';
import '../widgets/form_field_with_label.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  late TextEditingController controllerl;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controllerl = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controllerl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvgPicture(path: Assets.assetsImgsLogo),
                    SizedBox(width: 16),
                    Text(
                      "Tasky",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                SizedBox(height: 108),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To Tasky ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    CustomSvgPicture(path: Assets.assetsImgsWavingHand),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Your productivity journey starts here.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 24),
                CustomSvgPicture(path: Assets.assetsImgsGetStartImage),
                SizedBox(height: 28),
                CustomTextFormField(
                  title: "Full Name",
                  hintText: "e.g. Sarah Khalid",
                  controllerl: controllerl,
                  validator: (value) {
                    if (value.isNullString) {
                      return 'Please enter Full Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString(
                        Constant.nameKey,
                        controllerl.text.trim(),
                      );

                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LayoutScreen(),
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Let’s Get Started"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
