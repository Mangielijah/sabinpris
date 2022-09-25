import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/util.dart';
import 'package:sabinpris/service_locator.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
    languageNotifier = ValueNotifier(LanguageSector.english);
    classesNotifier = ValueNotifier(StudentClass.preNusery);
    genderNotifier = ValueNotifier(Gender.male);
    _dropdownGenders = buildDropdownItems<Gender>(Gender.values);
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColorLight,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Image.asset(
            //   'assets/grnbkgrnd.png',
            //   fit: BoxFit.cover,
            // ),
            Container(
              height: size.height * .9,
              width: size.height * 1.1,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Back(),
                        Text(
                          'Financial Report',
                          style: TextStyle(
                            color: kGreenColor,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Report Type',
                        style: TextStyle(
                          color: kTextMainColorLight,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            final summary = await _buildSummary();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => summary));
                          },
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.download_rounded,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'General Summary',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download_rounded,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'English section summary',
                                style: TextStyle(
                                  color: Color(0xff4D4D4D),
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download_rounded,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'French section summary',
                                style: TextStyle(
                                  color: Color(0xff4D4D4D),
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download_rounded,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Fee collection summary',
                                style: TextStyle(
                                  color: Color(0xff4D4D4D),
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                        classesNotifier.value =
                                            stdClass ?? StudentClass.preNusery;
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: LongButton(
                            size: size,
                            color: kGreenColor,
                            title: 'Generate',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download_rounded,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Download',
                                style: TextStyle(
                                  color: Color(0xff4D4D4D),
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                            'Reg Fee',
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
                                            'Fee Amt.',
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
                                            'Fees Paid',
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
                              Expanded(
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: const [
                                    ReportStudentTile(
                                      studentNumber: '1',
                                      studentName: 'Richard Nkolosombe Fimbo',
                                      studentRegFee: '5,000',
                                      studentFeeAmt: '70,000',
                                      studentFeePaid: '56,500',
                                      studentFeeBalance: '13,000',
                                    ),
                                    ReportStudentTile(
                                      studentNumber: '2',
                                      studentName: 'Desmond Piku Abanseka',
                                      studentRegFee: '5,000',
                                      studentFeeAmt: '70,000',
                                      studentFeePaid: '56,500',
                                      studentFeeBalance: '13,000',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 11,
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
                                            '10,000',
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
                                            '140,000',
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
                                            '108,000',
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
                                            '31,500',
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

  Future<Widget> _buildSummary() async {
    final head = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          padding: const EdgeInsets.all(4),
          foregroundDecoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide.none,
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: const Center(
            child: Text(
              'SN',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          width: 170,
          padding: const EdgeInsets.all(4),
          foregroundDecoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide.none,
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: const Center(
            child: Text(
              'DESCRIPTION',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.all(4),
          foregroundDecoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide.none,
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: const Center(
            child: Text(
              'ROLL',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          width: 170,
          padding: const EdgeInsets.all(4),
          foregroundDecoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide.none,
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: const Center(
            child: Text(
              'FEES DUE',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          width: 170,
          padding: const EdgeInsets.all(4),
          foregroundDecoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide.none,
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: const Center(
            child: Text(
              'REGISTRATION',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          width: 170,
          padding: const EdgeInsets.all(4),
          foregroundDecoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: const Center(
            child: Text(
              'TOTAL INCOME',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );

    _buildRow(GeneralStatistics statistics, int index) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              padding: const EdgeInsets.all(4),
              foregroundDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(color: Colors.black),
                  right: BorderSide.none,
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              width: 170,
              padding: const EdgeInsets.all(4),
              foregroundDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(color: Colors.black),
                  right: BorderSide.none,
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  statistics.description,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              padding: const EdgeInsets.all(4),
              foregroundDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(color: Colors.black),
                  right: BorderSide.none,
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  '${statistics.roll}',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              width: 170,
              padding: const EdgeInsets.all(4),
              foregroundDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(color: Colors.black),
                  right: BorderSide.none,
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  '${statistics.feesDue}',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              width: 170,
              padding: const EdgeInsets.all(4),
              foregroundDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(color: Colors.black),
                  right: BorderSide.none,
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  '${statistics.registration}',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Container(
              width: 170,
              padding: const EdgeInsets.all(4),
              foregroundDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  '${statistics.totalIncome}',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        );
    int statCount = 0;
    final body = (await serviceLocator<StudentRecordRepository>()
            .getGeneralStatistics(SCHOOL_YEAR))
        .map((statistic) {
      statCount++;
      return _buildRow(statistic, statCount);
    }).toList();

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'SABINPRIS / GOOD SHEPHERD SCHOOL - MOTOWOH LIMBE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'CONSOLIDATED SUMMARY OF INCOME COLLECTED FOR THE ACADEMIC YEAR $SCHOOL_YEAR',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                  child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  head,
                  ...body,
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
