// ignore_for_file: file_names

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  bool _value = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _feesPaidController = TextEditingController();

  List<DropdownMenuItem<LanguageSector?>> _dropdownLanguages = [];
  List<DropdownMenuItem<Gender?>> _dropdownGenders = [];
  List<DropdownMenuItem<StudentClass?>> _dropdownClasses = [];

  // List<String> languages = ['English Sector', 'French Sector'];
  // List<String> genders = ['Male', 'Female'];
  // List<String> classes = [
  //   'Pre-Nursery',
  //   'Nursery I',
  //   'Nursery II',
  //   'Class 1',
  //   'Class 2',
  //   'Class 3',
  //   'Class 4',
  //   'Class 5',
  //   'Class 6'
  // ];

  late ValueNotifier<LanguageSector> languageNotifier;
  late ValueNotifier<StudentClass> classesNotifier;
  late ValueNotifier<Gender> genderNotifier;

  @override
  void initState() {
    super.initState();
    languageNotifier = ValueNotifier(LanguageSector.english);
    classesNotifier = ValueNotifier(StudentClass.preNusery);
    genderNotifier = ValueNotifier(Gender.male);
    _dropdownGenders = buildDropdownItems<Gender>(Gender.values);
    _dropdownLanguages =
        buildDropdownItems<LanguageSector>(LanguageSector.values);
    _dropdownClasses = buildDropdownItems<StudentClass>(StudentClass.values);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  List<DropdownMenuItem<T?>> buildDropdownItems<T>(List<T> itemList) {
    List<DropdownMenuItem<T?>> items = [];
    for (var item in itemList) {
      if (item is Gender) {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(
              (item.name),
            ),
          ),
        );
      }
      if (item is LanguageSector) {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(
              (item.name),
            ),
          ),
        );
      }
      if (item is StudentClass) {
        late String displayClass;
        if (item == StudentClass.preNusery) {
          displayClass = 'Pre-Nursery';
        } else if (item == StudentClass.nuseryOne) {
          displayClass = 'Nursery I';
        } else if (item == StudentClass.nuseryTwo) {
          displayClass = 'Nursery II';
        } else if (item == StudentClass.classOne) {
          displayClass = 'Class 1';
        } else if (item == StudentClass.classTwo) {
          displayClass = 'Class 2';
        } else if (item == StudentClass.classThree) {
          displayClass = 'Class 3';
        } else if (item == StudentClass.classFour) {
          displayClass = 'Class 4';
        } else if (item == StudentClass.classFive) {
          displayClass = 'Class 5';
        } else if (item == StudentClass.classSix) {
          displayClass = 'Class 6';
        }
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(displayClass),
          ),
        );
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(
              'assets/bluebkgrnd.png',
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
                            'Register a New Student',
                            style: TextStyle(
                              color: kBlueColor,
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
                                color: kBlueColor,
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
                          mainColor: kBlueColor),
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
                                          color: kBlueColor,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                ValueListenableBuilder(
                                    valueListenable: genderNotifier,
                                    builder: (context, gender, _) {
                                      return DropdownBelow(
                                        value: gender,
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
                                                Border.all(color: kBlueColor)),
                                        boxPadding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        boxHeight: 40,
                                        dropdownColor: Colors.white,
                                        items: _dropdownGenders,
                                        onChanged: (g) {
                                          genderNotifier.value =
                                              g ?? Gender.male;
                                        },
                                      );
                                    })
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
                                      ? Border.all(color: kBlueColor)
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
                                      color: kBlueColor,
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
                                          color: kBlueColor,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                ValueListenableBuilder(
                                    valueListenable: languageNotifier,
                                    builder: (context, sector, _) {
                                      return DropdownBelow(
                                        value: sector,
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
                                                Border.all(color: kBlueColor)),
                                        boxPadding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        boxHeight: 40,
                                        dropdownColor: Colors.white,
                                        items: _dropdownLanguages,
                                        onChanged: (value) {
                                          languageNotifier.value =
                                              value ?? LanguageSector.english;
                                        },
                                      );
                                    }),
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
                                          color: kBlueColor,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                ValueListenableBuilder(
                                    valueListenable: classesNotifier,
                                    builder: (context, studentClass, _) {
                                      return DropdownBelow(
                                        value: studentClass,
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
                                                Border.all(color: kBlueColor)),
                                        boxPadding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        boxHeight: 40,
                                        dropdownColor: Colors.white,
                                        items: _dropdownClasses,
                                        onChanged: (stdClass) {
                                          classesNotifier.value = stdClass ??
                                              StudentClass.preNusery;
                                        },
                                      );
                                    }),
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
                                color: kBlueColor,
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
                          mainColor: kBlueColor),
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
                                color: kBlueColor,
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
                              mainColor: kBlueColor),
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
                                mainColor: kBlueColor),
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
                        color: kBlueColor,
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
