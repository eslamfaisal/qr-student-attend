import 'dart:async';

import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stack overflow',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {},
      home: KanbanState(),
    );
  }
}

class KanbanState extends StatefulWidget {
  @override
  KanbanStateState createState() {
    return KanbanStateState();
  }
}

class KanbanStateState extends State<KanbanState> {
  ScrollController  controller  =   ScrollController();

  double offset = 55.0;
  scrollRight(){
    controller.animateTo(
        offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      print(controller.offset);
    });

    Timer.periodic(Duration(seconds: 2), (timer) {
      scrollRight();
      offset+=55.0;
    });

  }
  @override
  Widget build(BuildContext context) {
    Widget  tagList = Container(
      color: Colors.green,
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[

        ],
      ),
    );

    Widget boardView = Container(
      color: Colors.blue,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Row(
              children: const <Widget>[
                Expanded(child: Text("This is item name")),
                Text("12 Dec 18"),
              ],
            ),
          );
        },
      ),
    );

    //  int _value=0;
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text("Test title"),
        ),
        body: Container(
          color: Colors.amber,
          child: new Column(
            children: <Widget>[
              tagList,
              Expanded(
                child: boardView,
              )
            ],
          ),
          margin: EdgeInsets.all(10.0),
        ));
  }
}
