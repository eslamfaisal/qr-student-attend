import 'package:first/ProFile/user.dart';
import 'package:first/ProFile/userPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'ProfileWidget.dart';
import 'TextFieldWidget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Userr user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              onChanged: (name) {},
              text: user.name,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              onChanged: (email) {},
              text: user.email,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              onChanged: (about) {},
              text: user.about,
              maxLines: 5,
            ),
          ],
        ),
      );
}
