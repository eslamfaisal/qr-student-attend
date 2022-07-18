import 'package:flutter/material.dart';
import '../Headers/Header.dart';
import '../Inputs/InputWrapper.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.deepOrange[700]!,
                Colors.deepOrange[200]!,
                Colors.deepOrange[400]!
              ]),
        ),
        child: Column(
          children:<Widget> [
             SizedBox(height: 80,),
            Header(),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),

    );
  }
}
