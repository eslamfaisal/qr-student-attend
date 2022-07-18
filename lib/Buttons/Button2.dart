import 'package:first/Welcomee/LoginPage.dart';
import 'package:first/Welcomee/SignupPage.dart';
import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children:[ Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.cyanAccent[400]!),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                ),
              ),
              onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text(
                "  Login  ",
                style: TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyanAccent[400]!),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SignupPage()));
                },
                child: Text(
                  "  Sign Up  ",
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ]
        )



    );

  }
}
