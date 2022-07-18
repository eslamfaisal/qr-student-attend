import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/ProFile/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'NavigationDrawerWidget.dart';
import 'Scanner.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Welcome'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,

        ),

      ),
    );
  }
}
