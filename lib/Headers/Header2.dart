import 'package:flutter/material.dart';

class Header2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text("Welcome", style: TextStyle(
                color: Colors.white,
                fontSize: 40
            ),),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text("BFCAI Attendance",style: TextStyle(
              fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20
            ),),
          )
        ],
      ),
    );
  }

}