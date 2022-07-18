import 'package:flutter/material.dart';

class InputField2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Year",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Departement",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Section",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "ID",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: DropDown()
          ),
        ],
      ),
    );
  }
}
class DropDown extends StatefulWidget{
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState()=> _DropDownState();

}
class _DropDownState extends State<DropDown>{
  String? valueChoose;
  List listItem = [
    'Item1','Item2','Item3','Item4'
  ];
  @override
  Widget build(BuildContext context) {

    return Container(
      child: DropdownButton(
        value: valueChoose,
        onChanged: (newValue){
          setState(() {
            valueChoose = newValue as String?;
          });
        },
        items: listItem.map((valueItem){
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList()

      ),
    );
  }

}
