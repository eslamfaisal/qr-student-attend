import 'package:first/ProFile/thems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar buildAppBar(BuildContext context) {
  //final isDarkMode = Theme.of(context).brightness == Brightness.dark;
 const icon = true? CupertinoIcons.moon_stars : CupertinoIcons.sun_max;


  
  var color;
  return AppBar(
    leading: BackButton(
      color: color == false? Colors.white : Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
       Consumer<ThemeNotifier>(
         builder:(context, notifier, child)=> IconButton(
            color: color == false? Colors.white : Colors.black,
            icon: Icon(icon),
            onPressed: () {
              notifier.toggleTheme();
            },
          ),
       ),
      
    ],
  );
}