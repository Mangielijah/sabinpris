// ignore_for_file: file_names

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';

class UpdateStudent extends ConsumerStatefulWidget {
  const UpdateStudent({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends ConsumerState<UpdateStudent> {
  bool _paidReg = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _feesPaidController = TextEditingController();

  List<DropdownMenuItem<Object?>> _dropdownLanguages = [];
  List<DropdownMenuItem<Object?>> _dropdownGenders = [];
  List<DropdownMenuItem<Object?>> _dropdownClasses = [];
  
  late ValueNotifier<LanguageSector> languageNotifier;
  late ValueNotifier<StudentClass> classesNotifier;
  late ValueNotifier<Gender> genderNotifier;
  bool initLoad = true;
    
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
  void initState() {
    super.initState();
    languageNotifier = ValueNotifier(LanguageSector.english);
    classesNotifier = ValueNotifier(StudentClass.preNusery);
    genderNotifier = ValueNotifier(Gender.male);
    _dropdownGenders = buildDropdownItems<Gender>(Gender.values);
    _dropdownLanguages = buildDropdownItems<LanguageSector>(LanguageSector.values);
    _dropdownClasses = buildDropdownItems<StudentClass>(StudentClass.values);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (initLoad) {
        setState(() {
          initLoad = false;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer(builder: (context, state, child) {
    final modeProvider = ref.watch(themeModeProvider);
    final currentMode = modeProvider.currentMode;
      return Scaffold(
        backgroundColor: (!currentMode)? kTabColorLight: kTabColorDark,
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
                  color: (!currentMode)? Colors.white :Color(0xff202020),
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
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Full Name',
                              style: TextStyle(
                                color: (!currentMode)? kTextMainColorLight:kTextMainColorDark,
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
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Gender',
                                        style: TextStyle(
                                          color: (!currentMode)?kTextMainColorLight:kTextMainColorDark,
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
                                ValueListenableBuilder(
                                    valueListenable: genderNotifier,
                                    builder: (context, gender, _) {
                                      return DropdownBelow(
                                        value: gender,
                                        itemWidth: size.width * .22,
                                        itemTextstyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode) ?Colors.black : Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hint: Text(
                                          'select a gender',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode) ?Colors.grey[300] : Colors.grey[500],
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        boxTextstyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode) ?Colors.black:Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        boxDecoration: BoxDecoration(
                                            color: (!currentMode) ?Colors.white:Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border:
                                                Border.all(color: kYellowColor)),
                                        boxPadding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: (!currentMode) ?Colors.black:Colors.white,
                                          size: 25,
                                        ),
                                        boxHeight: 40,
                                        dropdownColor: (!currentMode) ?Colors.white :Colors.black,
                                        items: _dropdownGenders,
                                        onChanged: (g) {
                                          genderNotifier.value = g ?? Gender.male as dynamic;
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Paid Registration Fee (5000xaf)',
                          style: TextStyle(
                            color: (!currentMode)?kTextMainColorLight:Colors.white,
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
                              _paidReg = !_paidReg;
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: (!currentMode)?Colors.white:Colors.black,
                                  border: (_paidReg)
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
                              child: _paidReg
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
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Language Sector',
                                        style: TextStyle(
                                          color: (!currentMode)?kTextMainColorLight:Colors.white,
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
                                ValueListenableBuilder(
                                    valueListenable: languageNotifier,
                                    builder: (context, sector, _) {
                                      return DropdownBelow(
                                        value: sector,
                                        itemWidth: size.width * .22,
                                        itemTextstyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode) ?Colors.black : Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hint: Text(
                                          'select a Language Sector',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode) ?Colors.grey[300] : Colors.grey[500],
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        boxTextstyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode) ?Colors.black:Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        boxDecoration: BoxDecoration(
                                            color: (!currentMode) ?Colors.white:Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border:
                                                Border.all(color: kYellowColor)),
                                        boxPadding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: (!currentMode) ?Colors.black:Colors.white,
                                          size: 25,
                                        ),
                                        boxHeight: 40,
                                        dropdownColor: (!currentMode) ?Colors.white :Colors.black,
                                        items: _dropdownLanguages,
                                        onChanged: (value) {
                                          languageNotifier.value = value ?? LanguageSector.english as dynamic;
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
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Class',
                                        style: TextStyle(
                                          color: (!currentMode)? kTextMainColorLight:Colors.white,
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
                                ValueListenableBuilder(
                                    valueListenable: classesNotifier,
                                    builder: (context, studentClass, _) {
                                      return DropdownBelow(
                                        value: studentClass,
                                        itemWidth: size.width * .2,
                                        itemTextstyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode) ?Colors.black : Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hint: Text(
                                          'select a class',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode) ?Colors.grey[300] : Colors.grey[500],
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        boxTextstyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode) ?Colors.black:Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        boxDecoration: BoxDecoration(
                                            color: (!currentMode) ?Colors.white:Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border:
                                                Border.all(color: kYellowColor)),
                                        boxPadding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: (!currentMode) ?Colors.black:Colors.white,
                                          size: 25,
                                        ),
                                        boxHeight: 40,
                                        dropdownColor: (!currentMode) ?Colors.white :Colors.black,
                                        items: _dropdownClasses,
                                        onChanged: (stdClass) {
                                          classesNotifier.value = stdClass ?? StudentClass.preNusery as dynamic;
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
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Parent / Guardian Full Name',
                              style: TextStyle(
                                color: (!currentMode)?kTextMainColorLight:Colors.white,
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
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Parent Phone Number',
                              style: TextStyle(
                                color: (!currentMode)? kTextMainColorLight:Colors.white,
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
                                color: (!currentMode)?Colors.white:Colors.black,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 0),
                                  ),
                                ]),
                            child: Center(
                                child: Text(
                              '+237',
                              style: TextStyle(
                                color: (!currentMode)?kTextMainColorLight:Colors.grey[500],
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Fees Paid',
                              style: TextStyle(
                                color: (!currentMode)?kTextMainColorLight:Colors.white,
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
                      const SizedBox(height: 8),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fee Amount'),
                          Text('Fee Paid'),
                          Text('Balance'),
                          Text('Date of Payment'),
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
                                controller: _feesPaidController,
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
                        onTap: () async {
                          debugPrint('tapped');
                          final fees = int.parse(_feesPaidController.text);
                          final record = StudentRecord(
                            academicYear: SCHOOL_YEAR,
                            fullName: _fullNameController.text,
                            gender: genderNotifier.value,
                            paidRegistration: _paidReg,
                            sector: languageNotifier.value,
                            studentClass: classesNotifier.value,
                            guardianName: _parentNameController.text,
                            guardianContact: _phoneNumberController.text,
                            feesPaid: [fees],
                          );
                        },
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
  });
  }
  }