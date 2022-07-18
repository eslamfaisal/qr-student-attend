import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first/Home.dart';
import 'package:first/QRGenerator.dart';
import 'package:first/constants.dart';
import 'package:first/models/user_model.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController emailController =
      TextEditingController(text: "ahmed180006@fci.bu.edu.eg");
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepOrange[400]!),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            onPressed: () async {
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim())
                  .then((value) {
                getUserDetails(value);
              });
            },
            child: Text(
              "  Login  ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }

  void getUserDetails(UserCredential value) {
    String userId = value.user!.uid;
    FirebaseFirestore.instance
        .collection("system_users")
        .where('email', isEqualTo: emailController.text.trim())
        .get()
        .then((value) {
      UserModel userModel =
          UserModel.fromJson(value.docChanges.first.doc.data()!);
      currentLoggedInUser = userModel;
      FirebaseMessaging.instance.subscribeToTopic(userModel.id!);
      if (currentLoggedInUser!.type == "doctor" ||
          currentLoggedInUser!.type == "assistant") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GeneratePage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
  }
}
