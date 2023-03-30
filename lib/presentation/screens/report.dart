// import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/pdf_util.dart';
import 'package:sabinpris/presentation/providers.dart';
import 'package:sabinpris/presentation/util.dart';
import 'package:cross_file/cross_file.dart';

class Report extends ConsumerStatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  ConsumerState<Report> createState() => _ReportState();
}

class _ReportState extends ConsumerState<Report> {
  List<DropdownMenuItem<LanguageSector?>> _dropdownLanguages = [];

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
    final modeProvider = ref.watch(themeModeProvider);
    final currentMode = modeProvider.currentMode;

    final feeStatsNotifier = ref.watch(feeStatsProvider);
    final feeStatistics = feeStatsNotifier.studentsFeeStats;

    final totalStats = feeStatsNotifier.totalStats;

    return Scaffold(
      backgroundColor:
          (!currentMode) ? kBackgroundColorLight : kBackgroundColorDark,
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
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Back(),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Financial Report',
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Report Type',
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
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            try {
                              final XFile file = await buildSummary();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: kGreenColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'General Report Successfully Downloaded: File is saved in ../Documents/ folder',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                              //await OpenFile.open(file.path);
                            } catch (e) {
                              debugPrint("error");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[400],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Error Downloading Report: Please try again',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  (!currentMode) ? Colors.white : Colors.black,
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
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 16,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'General Summary',
                                  style: TextStyle(
                                    color: (!currentMode)
                                        ? const Color(0xff4D4D4D)
                                        : Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              final XFile file = await buildSectionSummary(
                                  LanguageSector.english);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: kGreenColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'English Summary Report Successfully Downloaded: File is saved in ../Documents/ folder',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                              //await OpenFile.open(file.path);
                            } catch (e) {
                              debugPrint("error");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[400],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Error Downloading Report: Please try again',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  (!currentMode) ? Colors.white : Colors.black,
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
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 16,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'English section summary',
                                  style: TextStyle(
                                    color: (!currentMode)
                                        ? const Color(0xff4D4D4D)
                                        : Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              final XFile file = await buildSectionSummary(
                                  LanguageSector.french);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: kGreenColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'French Sector Report Successfully Downloaded: File is saved in ../Documents/ folder',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                              //await OpenFile.open(file.path);
                            } catch (e) {
                              debugPrint("error");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[400],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Error Downloading Report: Please try again',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  (!currentMode) ? Colors.white : Colors.black,
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
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 16,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'French section summary',
                                  style: TextStyle(
                                    color: (!currentMode)
                                        ? const Color(0xff4D4D4D)
                                        : Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Language Sector',
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
                                        'select a language sector',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: (!currentMode)
                                              ? Colors.grey[300]
                                              : Colors.white,
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
                                          border:
                                              Border.all(color: kGreenColor)),
                                      boxPadding: const EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 4),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Class',
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
                                              : Colors.white,
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
                                          border:
                                              Border.all(color: kGreenColor)),
                                      boxPadding: const EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 4),
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
                            onTap: () {
                              ref.read(feeStatsProvider).search(
                                    languageNotifier.value,
                                    classesNotifier.value,
                                  );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              final file =
                                  await ref.read(feeStatsProvider).download();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: kGreenColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Report Successfully Downloaded: File is saved in ../Documents/ folder',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                              //await OpenFile.open(file.path);
                            } catch (e) {
                              debugPrint("error");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[400],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Error Downloading Report: Please try again',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  (!currentMode) ? Colors.white : Colors.black,
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
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 16,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    color: (!currentMode)
                                        ? const Color(0xff4D4D4D)
                                        : Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
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
                          child: Builder(
                            builder: (context) {
                              if (feeStatsNotifier.isLoading) {
                                return const Center(
                                  child: SpinKitPulse(
                                    color: kGreenColor,
                                    size: 100,
                                  ),
                                );
                              }
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                    child: ListView.builder(
                                      itemCount: feeStatistics.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        FeeCollectionStatistics stats =
                                            feeStatistics[index];
                                        return ReportStudentTile(
                                          studentNumber: '${index + 1}',
                                          studentName: stats.name,
                                          studentRegFee:
                                              NumberFormat().format(stats.reg),
                                          studentFeeAmt: NumberFormat()
                                              .format(stats.feeAmt),
                                          studentFeePaid: NumberFormat()
                                              .format(stats.totalPaid),
                                          studentFeeBalance: NumberFormat()
                                              .format(stats.balance),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
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
                                      color: Colors.grey[400], fontSize: 10),
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
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  NumberFormat().format(totalStats.reg),
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
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  NumberFormat().format(totalStats.feeAmt),
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
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  NumberFormat().format(totalStats.totalPaid),
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
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  NumberFormat().format(totalStats.balance),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
