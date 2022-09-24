// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';

class UpdateStudentSearch extends ConsumerStatefulWidget {
  const UpdateStudentSearch({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateStudentSearch> createState() =>
      _UpdateStudentSearchState();
}

class _UpdateStudentSearchState extends ConsumerState<UpdateStudentSearch> {
  final TextEditingController _fullNameController = TextEditingController();

  List<DropdownMenuItem<LanguageSector?>> _dropdownLanguages = [];

  List<DropdownMenuItem<StudentClass?>> _dropdownClasses = [];

  late ValueNotifier<LanguageSector> languageNotifier;
  late ValueNotifier<StudentClass> classesNotifier;
  bool initLoad = true;
  @override
  void initState() {
    super.initState();
    languageNotifier = ValueNotifier(LanguageSector.english);
    classesNotifier = ValueNotifier(StudentClass.preNusery);
    _dropdownLanguages =
        buildDropdownItems<LanguageSector>(LanguageSector.values);
    _dropdownClasses = buildDropdownItems<StudentClass>(StudentClass.values);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (initLoad) {
        setState(() {
          initLoad = false;
        });
      }
    });
  }

  // List<String> languages = ['English Sector', 'French Sector'];
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
                              ValueListenableBuilder<LanguageSector>(
                                valueListenable: languageNotifier,
                                builder: (BuildContext context,
                                    LanguageSector lang, Widget? child) {
                                  return DropdownBelow(
                                    value: lang,
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
                                    items: _dropdownLanguages,
                                    onChanged: (value) {
                                      languageNotifier.value =
                                          value ?? LanguageSector.english;
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
                              ValueListenableBuilder<StudentClass>(
                                valueListenable: classesNotifier,
                                builder: (BuildContext context,
                                    StudentClass studentClass, Widget? child) {
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
                                    items: _dropdownClasses,
                                    onChanged: (stdClass) {
                                      classesNotifier.value =
                                          stdClass ?? StudentClass.preNusery;
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
                      size: size,
                      color: kYellowColor,
                      title: 'Search',
                      onTap: () {
                        ref.read(studentSearchProvider).search(
                              _fullNameController.text,
                              languageNotifier.value,
                              classesNotifier.value,
                            );
                      },
                    ),
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
                                child: Consumer(builder: (context, ref, _) {
                                  final studentsNotifier =
                                      ref.watch(studentSearchProvider);
                                  final students = studentsNotifier.students;
                                  if (studentsNotifier.isLoading) {
                                    return const Center(
                                      child: SpinKitPulse(
                                        color: kBlueColor,
                                        size: 100,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    itemCount: students.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      StudentRecord student = students[index];
                                      return StudentTile(
                                        student: student,
                                      );
                                    },
                                  );
                                }),
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
