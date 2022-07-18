import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/Scanner.dart';
import 'package:first/Welcomee/LoginPage.dart';
import 'package:flutter/material.dart';
import 'ProFile/ProfilePage.dart';
import 'Scanner.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xFFFD5F00),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 40),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person_outline,
              onClicked: () => selectItem(context, 0),
            ),
            const SizedBox(height: 40),
            buildMenuItem(
              text: 'Scan',
              icon: Icons.qr_code_scanner,
              onClicked: () => selectItem(context, 1),
            ),
            const SizedBox(height: 40),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout,
              onClicked: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  selectItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Scanner2()));
        break;
      case 2:
        FirebaseAuth.instance.signOut();
        break;
    }
  }
}

buildMenuItem({
  required String text,
  icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    onTap: onClicked,
  );
}
