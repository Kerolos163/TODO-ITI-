import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/UserDetails/State/user_details_provider.dart';
import 'package:to_do/widgets/form_field_with_label.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserDetailsProvider>(
      create: (context) => UserDetailsProvider()..init(),
      child: Scaffold(
        appBar: AppBar(title: Text("User Details")),
        body: Consumer<UserDetailsProvider>(
          builder: (context, userDetailsProvider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        CustomTextFormField(
                          title: "User Name",
                          hintText: "Enter Your Name",
                          controllerl: userDetailsProvider.nameController,
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          title: "Motivation Quote",
                          hintText: "",
                          controllerl: userDetailsProvider.quoteController,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await userDetailsProvider.saveUserInfo();
                      if (context.mounted) {
                        Navigator.pop(context, true);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    ),
                    child: Text("Save Changes"),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
