// import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/presentation/screens/login.dart';
import 'package:sabinpris/service_locator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sabinpris',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const LogIn(),
    );
  }
}
