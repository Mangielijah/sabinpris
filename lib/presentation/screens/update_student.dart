// ignore_for_file: file_names

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';
import 'package:sabinpris/presentation/util.dart';
import 'package:sabinpris/service_locator.dart';

class UpdateStudent extends ConsumerStatefulWidget {
  final StudentRecord student;
  const UpdateStudent({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  ConsumerState<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends ConsumerState<UpdateStudent> {
  bool _paidReg = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _feesPaidController = TextEditingController();

  List<DropdownMenuItem<LanguageSector?>> _dropdownLanguages = [];
  List<DropdownMenuItem<Gender?>> _dropdownGenders = [];
  List<DropdownMenuItem<StudentClass?>> _dropdownClasses = [];

  late ValueNotifier<LanguageSector> languageNotifier;
  late ValueNotifier<StudentClass> classesNotifier;
  late ValueNotifier<Gender> genderNotifier;
  bool initLoad = true;

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.student.fullName;
    _parentNameController.text = widget.student.guardianName;
    _phoneNumberController.text = widget.student.guardianContact;
    _paidReg = widget.student.paidRegistration;
    languageNotifier = ValueNotifier(widget.student.sector);
    classesNotifier = ValueNotifier(widget.student.studentClass);
    genderNotifier = ValueNotifier(widget.student.gender);
    _dropdownGenders = buildDropdownItems<Gender>([widget.student.gender]);
    _dropdownLanguages =
        buildDropdownItems<LanguageSector>([widget.student.sector]);
    _dropdownClasses =
        buildDropdownItems<StudentClass>([widget.student.studentClass]);
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
        backgroundColor: (!currentMode) ? kTabColorLight : kTabColorDark,
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
                    color:
                        (!currentMode) ? Colors.white : const Color(0xff202020),
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
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : kTextMainColorDark,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Align(
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
                          mainColor: kYellowColor,
                          disable: true,
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
                                          'Gender',
                                          style: TextStyle(
                                            color: (!currentMode)
                                                ? kTextMainColorLight
                                                : kTextMainColorDark,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Align(
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
                                          itemWidth: size.width * .2,
                                          itemTextstyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          hint: Text(
                                            'select a gender',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                              color: (!currentMode)
                                                  ? Colors.grey[300]
                                                  : Colors.grey[500],
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          boxTextstyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          boxDecoration: BoxDecoration(
                                              color: (!currentMode)
                                                  ? Colors.white
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: kYellowColor)),
                                          boxPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 14.0,
                                                  vertical: 4),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            size: 25,
                                          ),
                                          boxHeight: 40,
                                          dropdownColor: (!currentMode)
                                              ? Colors.white
                                              : Colors.black,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Paid Registration Fee (5000xaf)',
                            style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : Colors.white,
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
                            // onTap: () {
                            //   // setState(() {
                            //   //   _value = !_value;
                            //   // });
                            // },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: (!currentMode)
                                        ? Colors.white
                                        : Colors.black,
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
                                            color: (!currentMode)
                                                ? kTextMainColorLight
                                                : Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Align(
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
                                          itemWidth: size.width * .2,
                                          itemTextstyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          hint: Text(
                                            'select a Language Sector',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                              color: (!currentMode)
                                                  ? Colors.grey[300]
                                                  : Colors.grey[500],
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          boxTextstyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          boxDecoration: BoxDecoration(
                                              color: (!currentMode)
                                                  ? Colors.white
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: kYellowColor)),
                                          boxPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 14.0,
                                                  vertical: 4),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            size: 25,
                                          ),
                                          boxHeight: 40,
                                          dropdownColor: (!currentMode)
                                              ? Colors.white
                                              : Colors.black,
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
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Class',
                                          style: TextStyle(
                                            color: (!currentMode)
                                                ? kTextMainColorLight
                                                : Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Align(
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
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          hint: Text(
                                            'select a class',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                              color: (!currentMode)
                                                  ? Colors.grey[300]
                                                  : Colors.grey[500],
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          boxTextstyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          boxDecoration: BoxDecoration(
                                              color: (!currentMode)
                                                  ? Colors.white
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: kYellowColor)),
                                          boxPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 14.0,
                                                  vertical: 4),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.white,
                                            size: 25,
                                          ),
                                          boxHeight: 40,
                                          dropdownColor: (!currentMode)
                                              ? Colors.white
                                              : Colors.black,
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
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Parent / Guardian Full Name',
                                style: TextStyle(
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Align(
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
                          mainColor: kYellowColor,
                          disable: true,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Parent Phone Number',
                                style: TextStyle(
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Align(
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
                                  color: (!currentMode)
                                      ? Colors.white
                                      : Colors.black,
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
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : Colors.grey[500],
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
                              mainColor: kYellowColor,
                              disable: true,
                            ),
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
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : kTextMainColorDark,
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
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // color: kBackgroundColorLight,
                            borderRadius: BorderRadius.circular(6),
                            color: (!currentMode) ? Colors.white : Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              (!currentMode)
                                  ? const BoxShadow(
                                      color: kBackgroundColorLight,
                                      spreadRadius: -2.0,
                                      blurRadius: 8.0,
                                    )
                                  : BoxShadow(
                                      color:
                                          kBackgroundColorLight.withOpacity(0),
                                    )
                            ],
                          ),
                          child: StreamBuilder<StudentRecord>(
                              stream: serviceLocator<StudentRecordRepository>()
                                  .watchRecord(widget.student.recordId!),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final student = snapshot.data;
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                  child: Text(
                                                '#',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 10),
                                              )),
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
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    'Fee Amt',
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
                                                    'Amt Paid',
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
                                                    'Balance',
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
                                      SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          itemCount: student!.feesPaid.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            int fees = student.feesPaid[index];
                                            int fee = getClassFee(
                                                student.studentClass);
                                            return FeePaymentTile(
                                              index: index,
                                              feesPaid: fees,
                                              classFee: fee,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                children: [
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    'Total',
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
                                                    NumberFormat().format(
                                                        student.feesPaid.reduce(
                                                            (a, b) => a + b)),
                                                    style: TextStyle(
                                                        color: (!currentMode)
                                                            ? Colors.black
                                                            : Colors.white,
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
                                                    '',
                                                    style: TextStyle(
                                                        color: (!currentMode)
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 10),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return const Center(
                                  child: SpinKitPulse(
                                    size: 50,
                                    color: kBlueColor,
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ShortTextField(
                                hint: 'Enter Fees',
                                controller: _feesPaidController,
                                mainColor: kYellowColor,
                                disable: false,
                              ),
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
                            const SizedBox(width: 8),
                            Flexible(
                              child: LongButton(
                                size: size,
                                color: kYellowColor,
                                title: 'SAVE',
                                onTap: () async {
                                  if (_feesPaidController.text.isNotEmpty) {
                                    await serviceLocator<
                                            StudentRecordRepository>()
                                        .updateFees(
                                            widget.student.recordId!,
                                            int.parse(
                                                _feesPaidController.text));
                                    _feesPaidController.text = '';
                                  }
                                },
                              ),
                            ),
                          ],
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
