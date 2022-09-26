// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';
import 'package:sabinpris/presentation/providers.dart';
import 'package:sabinpris/presentation/screens/login.dart';
// import 'package:sabinpris/components/user_shared_preference.dart';
import 'package:sabinpris/presentation/screens/new_student.dart';
import 'package:sabinpris/presentation/screens/report.dart';
import 'package:sabinpris/presentation/screens/update_student_search.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/service_locator.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Scaffold(
        key: _scaffoldkey,
        backgroundColor:
            (!currentMode) ? kBackgroundColorLight : kBackgroundColorDark,
        endDrawer: Container(
          height: size.height,
          width: size.width * .25,
          color: (!currentMode) ? kBackgroundColorLight : kBackgroundColorDark,
          child: Column(
            children: [
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  _scaffoldkey.currentState?.closeEndDrawer();
                },
                child: Container(
                  width: size.width * .2,
                  height: size.height * .09,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: (!currentMode) ? kTabColorLight : kTabColorDark,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset('assets/Settings.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Backup & Restore',
                          style: TextStyle(
                            color: (!currentMode)
                                ? const Color(0xff4D4D4D)
                                : Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              InkWell(
                onTap: () {
                  _scaffoldkey.currentState?.closeEndDrawer();
                },
                child: Container(
                  width: size.width * .2,
                  height: size.height * .09,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: (!currentMode) ? kTabColorLight : kTabColorDark,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset('assets/Settings.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Report Issue',
                          style: TextStyle(
                            color: (!currentMode)
                                ? const Color(0xff4D4D4D)
                                : Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const LogIn();
                    }),
                  );
                },
                child: Container(
                  width: size.width * .2,
                  height: size.height * .09,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: (!currentMode) ? kTabColorLight : kTabColorDark,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset('assets/Settings.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Exit',
                          style: TextStyle(
                            color: (!currentMode)
                                ? const Color(0xff4D4D4D)
                                : Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        color: (!currentMode) ? kTabColorLight : kTabColorDark,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.green, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Number Of Students',
                            style: TextStyle(
                              color: (!currentMode)
                                  ? const Color(0xff4D4D4D)
                                  : Colors.white,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder(
                              stream: serviceLocator<StudentRecordRepository>()
                                  .totalNumberOfRegisteredStudent(SCHOOL_YEAR),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '${snapshot.data ?? '0'}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return const Text(
                                    'Error Loading',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                return const SpinKitPulse(
                                  color: kBlueColor,
                                  size: 50.0,
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        color: (!currentMode) ? kTabColorLight : kTabColorDark,
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Collected Fees',
                            style: TextStyle(
                              color: (!currentMode)
                                  ? const Color(0xff4D4D4D)
                                  : Colors.white,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder(
                              stream: serviceLocator<StudentRecordRepository>()
                                  .totalCollectedFees(SCHOOL_YEAR),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final amt =
                                      NumberFormat().format(snapshot.data ?? 0);
                                  return Text(
                                    amt,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return const Text(
                                    'Error Loading',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                return const SpinKitPulse(
                                  color: kBlueColor,
                                  size: 50.0,
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        color: (!currentMode) ? kTabColorLight : kTabColorDark,
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Students With Incomplete Fee Payments',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (!currentMode)
                                  ? const Color(0xff4D4D4D)
                                  : Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder(
                              stream: serviceLocator<StudentRecordRepository>()
                                  .numStudentWithInCompleteFees(SCHOOL_YEAR),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final amt =
                                      NumberFormat().format(snapshot.data ?? 0);
                                  return Text(
                                    amt,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return const Text(
                                    'Error Loading',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                return const SpinKitPulse(
                                  color: kBlueColor,
                                  size: 50.0,
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1),
                        color: (!currentMode) ? kTabColorLight : kTabColorDark,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Students With Complete Fee Payments',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (!currentMode)
                                  ? const Color(0xff4D4D4D)
                                  : Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          StreamBuilder(
                              stream: serviceLocator<StudentRecordRepository>()
                                  .numStudentWithCompleteFees(SCHOOL_YEAR),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final amt =
                                      NumberFormat().format(snapshot.data ?? 0);
                                  return Text(
                                    amt,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return const Text(
                                    'Error Loading',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                                return const SpinKitPulse(
                                  color: kBlueColor,
                                  size: 50.0,
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .2,
                    width: size.width * .18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width * .18,
                          height: size.height * .09,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: (!currentMode)
                                  ? kTabColorLight
                                  : kTabColorDark,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ]),
                          child: InkWell(
                            onTap: () {
                              modeProvider.toggleMode();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SvgPicture.asset('assets/SVGs/LM.svg'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Dark Mode',
                                    style: TextStyle(
                                      color: (!currentMode)
                                          ? const Color(0xff4D4D4D)
                                          : Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _scaffoldkey.currentState?.openEndDrawer();
                          },
                          child: Container(
                            width: size.width * .18,
                            height: size.height * .09,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: (!currentMode)
                                    ? kTabColorLight
                                    : kTabColorDark,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SvgPicture.asset('assets/Settings.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                      color: (!currentMode)
                                          ? const Color(0xff4D4D4D)
                                          : Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 30, bottom: 30),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const NewStudent();
                                  }),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: (!currentMode)
                                        ? kTabColorLight
                                        : kTabColorDark,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: (!currentMode)
                                          ? Image.asset('assets/1L.png')
                                          : Image.asset('assets/1D.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 25),
                                      child: Text(
                                        'Register a \nNew Student',
                                        style: TextStyle(
                                          color: (!currentMode)
                                              ? const Color(0xff4D4D4D)
                                              : Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const UpdateStudentSearch();
                                  }),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: (!currentMode)
                                        ? kTabColorLight
                                        : kTabColorDark,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: (!currentMode)
                                          ? Image.asset('assets/2L.png')
                                          : Image.asset('assets/2D.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 25),
                                      child: Text(
                                        'Edit / Update Student \nInformation',
                                        style: TextStyle(
                                          color: (!currentMode)
                                              ? const Color(0xff4D4D4D)
                                              : Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 24, top: 30, bottom: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return const Report();
                            }),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: (!currentMode)
                                  ? kTabColorLight
                                  : kTabColorDark,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ]),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: (!currentMode)
                                    ? Image.asset('assets/1L.png',
                                        width: size.width * .35)
                                    : Image.asset('assets/1D.png',
                                        width: size.width * .35),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 25),
                                child: Text(
                                  'Financial Report',
                                  style: TextStyle(
                                    color: (!currentMode)
                                        ? const Color(0xff4D4D4D)
                                        : Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
