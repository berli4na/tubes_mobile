import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/detail_program1.dart';
import 'package:ui/detail_program2.dart';
import 'package:ui/detail_program3.dart';
import 'package:ui/end_program.dart';
import 'package:ui/login.dart';
import 'package:ui/prep_program3.dart';
import 'package:ui/prep_skincare.dart';
import 'package:ui/profile_page.dart';
import 'package:ui/reset_password.dart';
import 'package:ui/reset_password_confirm.dart';
import 'package:ui/sign_up.dart';
import 'package:ui/edit_profile.dart';
import 'package:ui/splash_screen.dart';
import 'package:ui/get_started.dart';

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
          ThemeData.light().textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/reset_password',
      routes: {
        '/program_tiga': (context) => ProgramTigaScreen(),
        '/detail_program_tiga': (context) => DetailProgramTigaScreen(),
        '/detail_program_satu': (context) => DetailProgramSatuScreen(),
        '/detail_program_dua': (context) => DetailProgramDuaScreen(),
        '/program_selesai': (context) => ProgramBerakhirScreen(),
        '/persiapan_skincare': (context) => SkincareScreen(),
        '/login': (context) => LoginPage(),
        '/profile_page': (context) => ProfilePage(),
        '/reset_password': (context) => ResetPasswordPage(),
        '/reset_password_confirm': (context) => ResetPasswordScreen(),
        '/sign_up': (context) => MendaftarPage(),
        '/edit_profile': (context) => EditProfilPage(),
        '/splash_screen': (context) => TampilanAwalScreen(),
        '/get_started': (context) => MemulaiScreen(),
      },
    );
  }
}
