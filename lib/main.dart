import 'package:flutter/material.dart';
import 'package:ui/detail_program3.dart';
import 'package:ui/end_program.dart';
import 'package:ui/prep_program3.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/prep_skincare.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litzy',
       theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light()
              .textTheme, 
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/persiapan_skincare',
      routes: {
        '/program_tiga': (context) => ProgramTigaScreen(),
        '/detail_program_tiga': (context) => DetailProgramTigaScreen(),
        '/program_selesai': (context) => ProgramBerakhirScreen(),
        '/persiapan_skincare': (context) => SkincareScreen(),
      },
    );
  }
}
