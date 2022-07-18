import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/constants.dart';
import 'package:first/models/AttendDateModel.dart';
import 'package:first/models/AttendType.dart';
import 'package:first/models/SubjectModel.dart';
import 'package:first/models/attend_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData =
      "https://github.com/neon97"; // already generated qr code when the page opens
  String dropdownValue1 = 'Distributed';
  String dropdownValue2 = 'One';

  final qrdataFeed = TextEditingController();

  List<SubjectModel> allSubjectsList = [];
  SubjectModel? selectedSubject;
  AttendDateModel? selectedSubjectDate;

  List<AttendDateModel> subjectDatesList = [];
  List<AttendDateModel> filteredDates = [];

  AttendType selectedAttendType = AttendType.Lecture;
  var attendTypes = [AttendType.Lecture, AttendType.Section];

  int selectedSectionNumber = 1;
  var sectionsNumbers = [1, 2, 3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('QR Code Generator'),
        actions: <Widget>[],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(children: [
                  if (selectedSubject != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<SubjectModel>(
                        underline: const SizedBox(),
                        icon: const Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        value: selectedSubject,
                        items: allSubjectsList.map((SubjectModel value) {
                          return DropdownMenuItem<SubjectModel>(
                            value: value,
                            child: Text(
                              value.name!,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedSubject = (value);
                          getSubjectDates();
                          setState(() {});
                        },
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<AttendType>(
                      underline: const SizedBox(),
                      icon: const Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      value: selectedAttendType,
                      items: attendTypes.map((AttendType value) {
                        return DropdownMenuItem<AttendType>(
                          value: value,
                          child: Text(
                            value.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setSelectedAttend(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (selectedAttendType == AttendType.Section)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<int>(
                        underline: const SizedBox(),
                        icon: const Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        value: selectedSectionNumber,
                        items: sectionsNumbers.map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setSelectedSectionNumber(value);
                        },
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (selectedSubjectDate != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<AttendDateModel>(
                        underline: const SizedBox(),
                        icon: const Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        value: selectedSubjectDate,
                        items: filteredDates.map((AttendDateModel value) {
                          return DropdownMenuItem<AttendDateModel>(
                            value: value,
                            child: Text(
                              value.date!,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedDate(value);
                        },
                      ),
                    ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              if (filteredDates.isNotEmpty)
                Center(
                  child: QrImage(
                    //plce where the QR Image will be shown
                    data: qrData,
                    size: 400,
                  ),
                ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  generateNewAttendModel() {
    if (selectedSubjectDate == null) return;
    if (selectedSubject == null) return;
    if (selectedAttendType == null) return;

    AttendModel attendModel = AttendModel(
      id: selectedSubject!.id! +
          selectedSubjectDate!.date!,
      attendType: selectedAttendType.name,
      date: selectedSubjectDate!.date,
      sectionNumber: selectedSectionNumber.toString(),
      subjectId: selectedSubject!.id,
      subjectName: selectedSubject!.name,
      userId: currentLoggedInUser!.id!,
      userName: currentLoggedInUser!.name!,
    );

    String modelData = jsonEncode(attendModel.toJson());

    qrData = modelData;
    setState(() {});
  }

  void getData() {
    FirebaseFirestore.instance.collection("subjects").get().then((value) {
      value.docs.forEach((element) {
        allSubjectsList.add(SubjectModel.fromJson(element.data()));
      });
      selectedSubject = allSubjectsList[0];
      getSubjectDates();
    });
  }

  void getSubjectDates() {
    subjectDatesList.clear();
    FirebaseFirestore.instance
        .collection("subjects")
        .doc(selectedSubject!.id)
        .collection("attend_date")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        subjectDatesList.add(AttendDateModel.fromJson(element.data()));
        initSelectedDate();
      });
      setState(() {});
    });
  }

  void initSelectedDate() {
    selectedSubjectDate = null;
    filteredDates.clear();
    if (selectedAttendType == AttendType.Lecture) {
      filteredDates.addAll(subjectDatesList
          .where((element) => element.type == AttendType.Lecture.name)
          .toList());
    } else {
      filteredDates.addAll(subjectDatesList
          .where((element) =>
              element.sectionNumber == selectedSectionNumber.toString())
          .toList());
    }
    if (filteredDates.isNotEmpty) {
      selectedSubjectDate = filteredDates[0];
    }

    generateNewAttendModel();
  }

  void setSelectedAttend(AttendType? value) {
    selectedAttendType = value!;
    initSelectedDate();
  }

  void selectedDate(AttendDateModel? value) {
    selectedSubjectDate = value;
    generateNewAttendModel();
  }

  void setSelectedSectionNumber(int? value) {
    selectedSectionNumber = value!;
    setState(() {});
    initSelectedDate();
  }
}
