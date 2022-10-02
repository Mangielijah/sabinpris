import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/screens/update_student.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/presentation/providers.dart';

class Back extends ConsumerWidget {
  const Back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      final currentMode = modeProvider.currentMode;
      return SizedBox(
        width: 30,
        height: 30,
        child: Container(
          decoration: BoxDecoration(
            color: (!currentMode) ? Colors.white : Colors.black,
            boxShadow: [
              // (state)?
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 16,
              color: (!currentMode) ? kTextMainColorLight : Colors.white,
            ),
          ),
        ),
      );
    });
  }
}

class LoginTextField extends ConsumerWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;

  const LoginTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: (!currentMode) ? Colors.white : Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              backgroundColor:
                  (!currentMode) ? Colors.transparent : Colors.black,
              color: (!currentMode) ? Colors.black : Colors.white,
            ),
            cursorColor: Colors.green,
            // controller: _emailController,
            obscureText: obscureText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: false,
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: (!currentMode) ? Colors.grey[500] : Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class LongTextField extends ConsumerWidget {
  final String hint;
  final TextEditingController controller;
  final Color mainColor;
  final bool disable;

  const LongTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.mainColor,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Container(
        height: 40,
        decoration: BoxDecoration(
          color: (!currentMode) ? Colors.white : Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextFormField(
          controller: controller,
          enabled: !disable,
          style: TextStyle(
              backgroundColor: Colors.transparent,
              color: (!currentMode) ? Colors.black : Colors.white,
              fontSize: 12),
          cursorColor: mainColor,
          obscureText: false,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: false,
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: (!currentMode) ? Colors.grey[300] : Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      );
    });
  }
}

class ShortTextField extends ConsumerWidget {
  final String hint;
  final TextEditingController controller;
  final Color mainColor;
  final bool disable;

  const ShortTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.mainColor,
      required this.disable})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: (!currentMode) ? Colors.white : Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
              backgroundColor: Colors.transparent,
              color: (!currentMode) ? Colors.black : Colors.white,
              fontSize: 12),
          cursorColor: mainColor,
          enabled: !disable,
          obscureText: false,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: false,
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: (!currentMode) ? Colors.grey[300] : Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      );
    });
  }
}

class StudentTile extends ConsumerWidget {
  final StudentRecord student;

  const StudentTile({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return UpdateStudent(student: student);
              }),
            );
          },
          child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: (!currentMode) ? Colors.white : const Color(0xff202020),
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
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        student.recordId.toString(),
                        style: TextStyle(
                            color: (!currentMode)
                                ? kTextMainColorLight
                                : kTextMainColorDark,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          student.fullName,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          student.studentClass.name,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          student.gender.name,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}

class LongButton extends ConsumerWidget {
  const LongButton({
    Key? key,
    required this.size,
    required this.color,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String title;
  final Color color;
  final Function? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return InkWell(
        onTap: () => (onTap != null) ? onTap!() : () {},
        child: Container(
          height: 40,
          width: size.width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: (!currentMode) ? Colors.white : Colors.black,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ReportStudentTile extends ConsumerWidget {
  final String studentNumber;
  final String studentName;
  final String studentRegFee;
  final String studentFeeAmt;
  final String studentFeePaid;
  final String studentFeeBalance;

  const ReportStudentTile(
      {Key? key,
      required this.studentNumber,
      required this.studentName,
      required this.studentRegFee,
      required this.studentFeeAmt,
      required this.studentFeePaid,
      required this.studentFeeBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (BuildContext context) {
            //     return UpdateStudent(student: Student,);
            //   }),
            // );
          },
          child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: (!currentMode) ? Colors.white : const Color(0xff202020),
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
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        studentNumber,
                        style: TextStyle(
                            color: (!currentMode)
                                ? kTextMainColorLight
                                : kTextMainColorDark,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          studentName,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          studentRegFee,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          studentFeeAmt,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          studentFeePaid,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          studentFeeBalance,
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}

class ExpenditureTile extends ConsumerWidget {
  final String Detail;
  final String Amount;
  final DateTime Date;
  final int index;

  const ExpenditureTile(
      {Key? key,
      required this.index,
      required this.Detail,
      required this.Amount,
      required this.Date})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (!currentMode) ? Colors.white : const Color(0xff202020),
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
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      '$index',
                      style: TextStyle(
                          color: (!currentMode)
                              ? kTextMainColorLight
                              : kTextMainColorDark,
                          fontSize: 10),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        Detail,
                        style: TextStyle(
                            color: (!currentMode)
                                ? kTextMainColorLight
                                : kTextMainColorDark,
                            fontSize: 10),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Text(
                        Amount.toString(),
                        style: TextStyle(
                            color: (!currentMode)
                                ? kTextMainColorLight
                                : kTextMainColorDark,
                            fontSize: 10),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Text(
                        DateFormat.yMMMd().add_jm().format(Date),
                        style: TextStyle(
                            color: (!currentMode)
                                ? kTextMainColorLight
                                : kTextMainColorDark,
                            fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}

class FeePaymentTile extends ConsumerWidget {
  // final StudentRecord student;
  final int feesPaid;
  final int classFee;
  final int index;

  const FeePaymentTile({
    Key? key,
    required this.classFee,
    required this.feesPaid,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      // ignore: unused_local_variable
      final currentMode = modeProvider.currentMode;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (BuildContext context) {
            //     return UpdateStudent(student: student);
            //   }),
            // );
          },
          child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: (!currentMode) ? Colors.white : const Color(0xff202020),
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
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        // student.recordId.toString(),
                        '${index + 1}',
                        style: TextStyle(
                            color: (!currentMode)
                                ? kTextMainColorLight
                                : kTextMainColorDark,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          // student.fullName,
                          NumberFormat().format(classFee),
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          // student.studentClass.name,
                          NumberFormat().format(feesPaid),
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          // student.gender.name,
                          '',
                          style: TextStyle(
                              color: (!currentMode)
                                  ? kTextMainColorLight
                                  : kTextMainColorDark,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}

enum PopUpType { error, success }

void showPopUp(BuildContext context, PopUpType type, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
            color: (type == PopUpType.error) ? Colors.red[400] : kBlueColor,
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            message,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      )));
}
