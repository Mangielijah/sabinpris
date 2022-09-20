// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/presentation/providers.dart';
// import 'package:sabinpris/components/user_shared_preference.dart';
import 'package:sabinpris/presentation/screens/new_student.dart';
import 'package:sabinpris/presentation/screens/report.dart';
import 'package:sabinpris/presentation/screens/update_student_search.dart';
import 'package:sabinpris/presentation/constants.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      final currentMode = modeProvider.currentMode;
      return Scaffold(
        backgroundColor: kBackgroundColorLight,
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
                        color: kTabColorLight,
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
                        children: const [
                          Text(
                            'Number Of Students',
                            style: TextStyle(
                              color: Color(0xff4D4D4D),
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '257',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        color: kTabColorLight,
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
                        children: const [
                          Text(
                            'Total Collected Fees',
                            style: TextStyle(
                              color: Color(0xff4D4D4D),
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '2, 627, 500 XAF',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        color: kTabColorLight,
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
                        children: const [
                          Text(
                            'Students With Incomplete Fee Payments',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff4D4D4D),
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '51',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width * .18,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1),
                        color: kTabColorLight,
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
                        children: const [
                          Text(
                            'Students With Complete Fee Payments',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff4D4D4D),
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '206',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
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
                              color: kTabColorLight,
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
                                children: const [
                                  // SvgPicture.asset('assets/Moon.png'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Dark Mode',
                                    style: TextStyle(
                                      color: Color(0xff4D4D4D),
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
                        Container(
                          width: size.width * .18,
                          height: size.height * .09,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kTabColorLight,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                // SvgPicture.asset('assets/Settings.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
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
                                    return NewStudent();
                                  }),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: kTabColorLight,
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
                                      child: Image.asset('assets/1L.png'),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 25),
                                      child: Text(
                                        'Register a \nNew Student',
                                        style: TextStyle(
                                          color: Color(0xff4D4D4D),
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
                                    return UpdateStudentSearch();
                                  }),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: kTabColorLight,
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
                                      child: Image.asset(
                                        'assets/2L.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 25),
                                      child: Text(
                                        'Edit / Update Student \nInformation',
                                        style: TextStyle(
                                          color: Color(0xff4D4D4D),
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
                              return Report();
                            }),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kTabColorLight,
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
                                child: Image.asset('assets/3L.png',
                                    width: size.width * .35),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 25),
                                child: Text(
                                  'Financial Report',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
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
