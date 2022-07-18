import 'package:flutter/material.dart';
import '../Headers/Header3.dart';
import '../Inputs/InputWrapper3.dart';

class SignupPage extends StatelessWidget {

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
          children:<Widget> [
            SizedBox(height: 80,),
            Header3(),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  )
              ),
              child: InputWrapper3(),
              // DropDown(),
            )
            )
          ],
        ),
      ),

    );
  }
}
