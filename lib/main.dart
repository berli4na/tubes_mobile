import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:ui/detail_program_1.dart';
import 'package:ui/detail_program_2.dart';
import 'package:ui/detail_program_3.dart';
import 'package:ui/detail_program_4.dart';
import 'package:ui/detail_program_5.dart';
import 'package:ui/detail_program_6.dart';
import 'package:ui/detail_program_7.dart';
import 'package:ui/edit_profile.dart';
import 'package:ui/end_program.dart';
import 'package:ui/get_started.dart';
import 'package:ui/homepage.dart';
import 'package:ui/login.dart';
import 'package:ui/panduan_skincare.dart';
import 'package:ui/profile_page.dart';
import 'package:ui/reset_password.dart';
import 'package:ui/reset_password_confirm.dart';
import 'package:ui/sign_up.dart';
import 'package:ui/splash_screen.dart';
import 'package:ui/waktu.dart';

=======
import 'package:ui/detail_program1.dart';
import 'package:ui/detail_program2.dart';
import 'package:ui/detail_program3.dart';
import 'package:ui/end_program.dart';
import 'package:ui/login.dart';
import 'package:ui/prep_program3.dart';
import 'package:ui/prep_skincare.dart';
>>>>>>> 4bd13e9641892f02f6180eadbd73dec8bbc6c3ca

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
<<<<<<< HEAD
      initialRoute: '/homepage',
      routes: {
        '/splash_screen': (context) => TampilanAwalScreen(),
        '/get_started': (context) => MemulaiScreen(),
        '/sign_up': (context) => MendaftarPage(),
=======
      initialRoute: '/detail_program_satu',
      routes: {
        '/program_tiga': (context) => ProgramTigaScreen(),
        '/detail_program_tiga': (context) => DetailProgramTigaScreen(),
        '/detail_program_satu': (context) => DetailProgramSatuScreen(),
        '/detail_program_dua': (context) => DetailProgramDuaScreen(),
        '/program_selesai': (context) => ProgramBerakhirScreen(),
        '/persiapan_skincare': (context) => SkincareScreen(),
>>>>>>> 4bd13e9641892f02f6180eadbd73dec8bbc6c3ca
        '/login': (context) => LoginPage(),
        '/reset_password': (context) => ResetPasswordPage(),
        '/reset_password_confirm': (context) => ResetPasswordScreen(),
        
        //beranda
        '/homepage': (context) => ProgramHomepage(),
        
        //profil
        '/profile_page': (context) => ProfilePage(),
        '/edit_profile': (context) => EditProfilPage(),

        '/waktu': (context) => YogaFaceScreen(),

        //program eksternal
        '/detail_program_1' : (context) => DetailProgram1(),
        '/detail_program_2' : (context) => DetailProgram2(),
        '/detail_program_3' : (context) => DetailProgram3(),
        '/detail_program_4' : (context) => DetailProgram4(),
        '/detail_program_5' : (context) => DetailProgram5(),
        '/detail_program_6' : (context) => DetailProgram6(),
        '/detail_program_7' : (context) => DetailProgram7(),

        //panduan skincare
        '/panduan_skincare' : (context) => PanduanSkincare(),

        //program selesai
        '/program_selesai': (context) => ProgramBerakhirScreen(),
      },
    );
  }
}
