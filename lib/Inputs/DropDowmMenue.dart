import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDowm extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDowm> {
  String dropdownValue1 = 'Distributed';
  String dropdownValue2 = 'One';


  @override
  Widget build(BuildContext context) =>
      Column(
    children: [DropdownButton<String>(
          value: dropdownValue1,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black12,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue1 = newValue!;
            });
          },
          items: <String>['Distributed', 'HPC', 'Optimization', 'TOC']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
    SizedBox(height: 10,),
    Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: DropdownButton<String>(
      value: dropdownValue2,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      isExpanded: true,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black12,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue2 = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Three']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
    ),

    ]
  );
}
