// ignore_for_file: file_names

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/components/ui_component.dart';
import 'package:sabinpris/constants.dart';

class UpdateStudent extends StatefulWidget {
  UpdateStudent({Key? key}) : super(key: key);

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  bool _value = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _feesPaidController = TextEditingController();

  List<DropdownMenuItem<Object?>> _dropdownLanguages = [];
  List<DropdownMenuItem<Object?>> _dropdownGenders = [];
  List<DropdownMenuItem<Object?>> _dropdownClasses = [];

  List<String> languages = ['English Sector', 'French Sector'];
  List<String> genders = ['Male', 'Female'];
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

  List<DropdownMenuItem<Object?>> buildDropdownItems(List _itemList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _itemList) {
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
    ValueNotifier<String> cutterntItemType3 = ValueNotifier(genders[0]);

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
              width: size.height * .8,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Back(),
                          SizedBox(width: size.width * .12),
                          const Text(
                            'Update Student Information',
                            style: TextStyle(
                              color: kYellowColor,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Align(
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '*',
                              style: TextStyle(
                                color: kYellowColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      LongTextField(
                          hint: 'Enter Full Name Here',
                          controller: _fullNameController,
                          mainColor: kYellowColor),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Gender',
                                        style: TextStyle(
                                          color: kTextMainColorLight,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                          color: kYellowColor,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                ValueListenableBuilder<String>(
                                  valueListenable: cutterntItemType3,
                                  builder: (BuildContext context, String value3,
                                      Widget? child) {
                                    return DropdownBelow(
                                      value: value3,
                                      itemWidth: size.width * .2,
                                      itemTextstyle: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hint: Text(
                                        'select a gender',
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                      items: _dropdownGenders =
                                          buildDropdownItems(genders),
                                      onChanged: (value3) {
                                        cutterntItemType3.value =
                                            value3.toString();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(flex: 1, child: Container()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Paid Registration Fee (5000xaf)',
                          style: TextStyle(
                            color: kTextMainColorLight,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _value = !_value;
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: (_value)
                                      ? Border.all(color: kYellowColor)
                                      : null,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 0),
                                    ),
                                  ]),
                              child: _value
                                  ? const Icon(
                                      Icons.check,
                                      size: 20.0,
                                      color: kYellowColor,
                                    )
                                  : null),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Align(
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
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                          color: kYellowColor,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                        cutterntItemType.value =
                                            value.toString();
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
                                Row(
                                  children: const [
                                    Align(
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
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                          color: kYellowColor,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Parent / Guardian Full Name',
                              style: TextStyle(
                                color: kTextMainColorLight,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '*',
                              style: TextStyle(
                                color: kYellowColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      LongTextField(
                          hint: 'Enter Full Name Here',
                          controller: _parentNameController,
                          mainColor: kYellowColor),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Parent Phone Number',
                              style: TextStyle(
                                color: kTextMainColorLight,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '*',
                              style: TextStyle(
                                color: kYellowColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 0),
                                  ),
                                ]),
                            child: const Center(
                                child: Text(
                              '+237',
                              style: TextStyle(
                                color: kTextMainColorLight,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ShortTextField(
                              hint: 'Phone number',
                              controller: _phoneNumberController,
                              mainColor: kYellowColor),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Fees Paid',
                              style: TextStyle(
                                color: kTextMainColorLight,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Numerical Values Only',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ShortTextField(
                                hint: '',
                                controller: _phoneNumberController,
                                mainColor: kYellowColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'XAF',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      LongButton(
                        size: size,
                        color: kYellowColor,
                        title: 'Done',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
