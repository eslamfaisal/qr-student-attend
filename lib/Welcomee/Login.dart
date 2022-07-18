import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 50),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.email),
                hintText: 'Enter Your Email',
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Enter Your Password',
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text).then((value){
                print('Login done');}
                );
              },
              child: Text('Log in'),
            )
          ],
        ),
      ),
    );
  }
}
