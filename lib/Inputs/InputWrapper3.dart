import 'package:first/Buttons/Button3.dart';
import 'package:flutter/material.dart';
import 'InputField2.dart';

class InputWrapper3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: InputField2(),
            ),
            SizedBox(
              height: 40,
            ),
            Button3()
          ],
        ),
      ),
    );
  }
}
