// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';
import 'package:sabinpris/presentation/screens/home.dart';

class LogIn extends ConsumerStatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  ConsumerState<LogIn> createState() => _LogInState();
}

class _LogInState extends ConsumerState<LogIn> {
  final TextEditingController _pswdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      final currentMode = modeProvider.currentMode;
      return Scaffold(
        backgroundColor:
            (!currentMode) ? kBackgroundColorLight : kBackgroundColorDark,
        body: Center(
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/bckgrnd.png',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  height: size.height * .65,
                  width: size.height * .5,
                  decoration: BoxDecoration(
                      color: (!currentMode)
                          ? Colors.white
                          : const Color(0xff202020),
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
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: (!currentMode)
                                        ? Colors.white
                                        : Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        spreadRadius: 4,
                                        blurRadius: 4,
                                        offset: const Offset(0, 0),
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: (!currentMode)
                                          ? Colors.grey[400]
                                          : Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 34),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: (!currentMode)
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 4),
                          LoginTextField(
                              hint: 'enter username',
                              controller: _emailController),
                          const SizedBox(height: 10),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: (!currentMode)
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 4),
                          LoginTextField(
                            hint: 'enter password',
                            controller: _pswdController,
                            obscureText: true,
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              splashColor: Colors.greenAccent[800],
                              onTap: () {
                                final email = _emailController.text;
                                final pwd = _pswdController.text;

                                if (email.isNotEmpty && pwd.isNotEmpty) {
                                  //Check typed credentials
                                  int emailIndex = allowedEmails.indexOf(email);
                                  if (emailIndex != -1) {
                                    final allowedPassword =
                                        allowedPasswords[emailIndex];
                                    if (allowedPassword == pwd) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return const Home();
                                        }),
                                      );
                                    } else {
                                      debugPrint("Incorrect Password");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[400],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Error: Incorrect Password',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: (!currentMode)
                                                  ? Colors.black
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                                    }
                                  } else {
                                    debugPrint("Incorrect Email");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red[400],
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Error: Incorrect Email',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            color: (!currentMode)
                                                ? Colors.black
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )));
                                  }
                                } else {
                                  debugPrint("No Email and Password Entered");
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red[400],
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                'Error: No Email and Password Entered',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  color: (!currentMode)
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          )));
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                    child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: (!currentMode)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
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
        ),
      );
    });
  }
}
