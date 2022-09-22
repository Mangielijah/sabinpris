import 'package:flutter/material.dart';
import 'package:sabinpris/presentation/screens/update_student.dart';
import 'package:sabinpris/presentation/constants.dart';

class Back extends StatelessWidget {
  const Back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder<bool>(
    //     valueListenable: UserSimplePreferences.isSwitchedDarkMode,
    //     builder: (context, state, _) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // color: (state) ? ButtonColor : backGroundColorLight,
          boxShadow: [
            // (state)?
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 0),
            )
            // : BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     spreadRadius: 1,
            //     blurRadius: 4,
            //     offset: Offset(0, 0),
            //   )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 16,
            color: kTextMainColorLight,
            // color: (state) ? Colors.grey : Colors.black,
          ),
        ),
      ),
    );
    // }
    // );
  }
}

class LoginTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
          style: const TextStyle(
            backgroundColor: Colors.transparent,
            color: Colors.black,
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
              color: Colors.grey[300],
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
  }
}

class LongTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Color mainColor;

  const LongTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
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
        style: const TextStyle(
            backgroundColor: Colors.transparent,
            color: Colors.black,
            fontSize: 12),
        cursorColor: mainColor,
        // controller: _emailController,

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
            color: Colors.grey[300],
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
  }
}

class ShortTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Color mainColor;

  const ShortTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
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
        style: const TextStyle(
            backgroundColor: Colors.transparent,
            color: Colors.black,
            fontSize: 12),
        cursorColor: mainColor,
        // controller: _emailController,

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
            color: Colors.grey[300],
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
  }
}

class StudentTile extends StatelessWidget {
  final String studentNumber;
  final String studentName;
  final String studentClass;
  final String studentGender;

  const StudentTile(
      {Key? key,
      required this.studentNumber,
      required this.studentName,
      required this.studentClass,
      required this.studentGender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return UpdateStudent();
            }),
          );
        },
        child: Container(
            height: 40,
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
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      studentNumber,
                      style: const TextStyle(
                          color: kTextMainColorLight, fontSize: 10),
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
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
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
                        studentClass,
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
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
                        studentGender,
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class LongButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class ReportStudentTile extends StatelessWidget {
  String studentNumber;
  String studentName;
  String studentRegFee;
  String studentFeeAmt;
  String studentFeePaid;
  String studentFeeBalance;

  ReportStudentTile(
      {Key? key,
      required this.studentNumber,
      required this.studentName,
      required this.studentRegFee,
      required this.studentFeeAmt,
      required this.studentFeePaid,
      required this.studentFeeBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return UpdateStudent();
            }),
          );
        },
        child: Container(
            height: 40,
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
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      studentNumber,
                      style: const TextStyle(
                          color: kTextMainColorLight, fontSize: 10),
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
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
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
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
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
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
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
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
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
                        style: const TextStyle(
                            color: kTextMainColorLight, fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
