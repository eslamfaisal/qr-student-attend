import 'package:flutter/material.dart';

class Button3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.cyanAccent[400]!),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

            ),
          ),
          onPressed: () {},
          child: Text(
            "  Sign Up  ",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
