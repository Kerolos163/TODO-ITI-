import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/constants/assets.dart';
import 'package:to_do/constants/extensions.dart';
import 'package:to_do/screens/my_tasks_screen.dart';
import 'package:to_do/widgets/form_field_with_label.dart';

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.assetsImgsLogo),
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
                    SvgPicture.asset(Assets.assetsImgsWavingHand),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Your productivity journey starts here.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 24),
                SvgPicture.asset(Assets.assetsImgsGetStartImage),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyTasksScreen(),
                        ),
                      );
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
