import 'package:first/Headers/Header2.dart';
import 'package:first/Inputs/InputWrapper2.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.cyanAccent[700]!,
                Colors.cyanAccent[200]!,
                Colors.cyanAccent[400]!
              ]),
        ),
        child: Column(

          children: <Widget>[
            SizedBox(height: 100,),
            Header2(),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper2(),
            ))
          ],
        ),
      ),
    );
  }
}