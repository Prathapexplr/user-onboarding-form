import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/onboarding/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const OnboardingScreen(),
    );
  }
}
