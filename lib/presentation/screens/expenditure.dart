import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';
import 'package:sabinpris/presentation/screens/add_expenditure.dart';
import 'package:sabinpris/presentation/screens/expendiruteReport.dart';

class Expenditures extends ConsumerStatefulWidget {
  const Expenditures({Key? key}) : super(key: key);

  @override
  ConsumerState<Expenditures> createState() => ExpendituresState();
}

class ExpendituresState extends ConsumerState<Expenditures> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Scaffold(
        backgroundColor:
            (!currentMode) ? kBackgroundColorLight : kBackgroundColorDark,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Back(),
                  SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: size.height * .2,
                            decoration: BoxDecoration(
                                color: (!currentMode)
                                    ? kTabColorLight
                                    : kTabColorDark,
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: Colors.green, width: 1),
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
                                    'Total Money Spent On Expenditures',
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
                                  Text(
                                    '1,504,250',
                                    style: TextStyle(
                                      color: kGreenColor,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: size.height * .2,
                            decoration: BoxDecoration(
                                color: (!currentMode)
                                    ? kTabColorLight
                                    : kTabColorDark,
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: Colors.green, width: 1),
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
                                    'Total Money Left',
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
                                  Text(
                                    '2,006,750',
                                    style: TextStyle(
                                      color: kGreenColor,
                                      fontSize: 30,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    const SizedBox(width: 70),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return AddExpenditure();
                                  }),
                                );
                        },
                        child: Container(
                          height: size.height * .7,
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
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: (!currentMode)
                                    ? Image.asset('assets/2L.png')
                                    : Image.asset('assets/2D.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25, left: 25),
                                child: Text(
                                  'Add Expenditure',
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
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ExpenditureReport();
                                  }),
                                );
                                },
                        child: Container(
                          height: size.height * .7,
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
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: (!currentMode)
                                    ? Image.asset('assets/2L.png')
                                    : Image.asset('assets/2D.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25, left: 25),
                                child: Text(
                                  'Expenditure Report',
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
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
