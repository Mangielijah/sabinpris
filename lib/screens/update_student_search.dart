// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/components/ui_component.dart';
import 'package:sabinpris/constants.dart';

class UpdateStudentSearch extends StatelessWidget {
  UpdateStudentSearch({Key? key}) : super(key: key);

  final TextEditingController _fullNameController = TextEditingController();

  List<DropdownMenuItem<Object?>> _dropdownLanguages = [];
  final List<DropdownMenuItem<Object?>> _dropdownClasses = [];
  List<String> languages = ['English Sector', 'French Sector'];
  List<String> classes = [
    'Pre-Nursery',
    'Nursery I',
    'Nursery II',
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6'
  ];

  List<DropdownMenuItem<Object?>> buildDropdownItems(List itemList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in itemList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ValueNotifier<String> cutterntItemType = ValueNotifier(languages[0]);
    ValueNotifier<String> cutterntItemType2 = ValueNotifier(classes[0]);

    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(
              'assets/ylwbkgnd.png',
              fit: BoxFit.cover,
            ),
            Container(
              height: size.height * .9,
              width: size.height * .85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Back(),
                        SizedBox(width: size.width * .12),
                        const Text(
                          'Update Student Information',
                          style: TextStyle(
                            color: Color(0xffFADC5A),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Search for student using their full name',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                          color: kTextMainColorLight,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    LongTextField(
                        hint: 'Enter Full Name Here',
                        controller: _fullNameController,
                        mainColor: kYellowColor),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: kTextMainColorLight,
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Search for student by class information',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Language Sector',
                                  style: TextStyle(
                                    color: kTextMainColorLight,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              ValueListenableBuilder<String>(
                                valueListenable: cutterntItemType,
                                builder: (BuildContext context, String value,
                                    Widget? child) {
                                  return DropdownBelow(
                                    value: value,
                                    itemWidth: size.width * .2,
                                    itemTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hint: Text(
                                      'select a language sector',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    boxTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    boxDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border:
                                            Border.all(color: kYellowColor)),
                                    boxPadding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 4),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    boxHeight: 40,
                                    dropdownColor: Colors.white,
                                    items: _dropdownLanguages =
                                        buildDropdownItems(languages),
                                    onChanged: (value) {
                                      cutterntItemType.value = value.toString();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Class',
                                  style: TextStyle(
                                    color: kTextMainColorLight,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              ValueListenableBuilder<String>(
                                valueListenable: cutterntItemType2,
                                builder: (BuildContext context, String value2,
                                    Widget? child) {
                                  return DropdownBelow(
                                    value: value2,
                                    itemWidth: size.width * .2,
                                    itemTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hint: Text(
                                      'select a class',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    boxTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    boxDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border:
                                            Border.all(color: kYellowColor)),
                                    boxPadding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 4),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    boxHeight: 40,
                                    dropdownColor: Colors.white,
                                    items: _dropdownLanguages =
                                        buildDropdownItems(classes),
                                    onChanged: (value2) {
                                      cutterntItemType2.value =
                                          value2.toString();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LongButton(
                        size: size, color: kYellowColor, title: 'Search'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // color: kBackgroundColorLight,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              const BoxShadow(
                                color: kBackgroundColorLight,
                                spreadRadius: -2.0,
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                        '#',
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 10),
                                      )),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Row(
                                        children: [
                                          Text(
                                            '|',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 16),
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Text(
                                            '|',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 16),
                                          ),
                                          const SizedBox(width: 16),
                                          Text(
                                            'Class',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Text(
                                            '|',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 16),
                                          ),
                                          const SizedBox(width: 16),
                                          Text(
                                            'Gender',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    StudentTile(
                                      studentNumber: '1',
                                      studentName: 'Richard Nkolosombe Fimbo',
                                      studentClass: 'Class 3',
                                      studentGender: 'Male',
                                    ),
                                    StudentTile(
                                      studentNumber: '2',
                                      studentName: 'Desmond Piku Abanseka',
                                      studentClass: 'Class 3',
                                      studentGender: 'Female',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
