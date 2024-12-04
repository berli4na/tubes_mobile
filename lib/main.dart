import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/detail_program_1.dart';
import 'package:ui/detail_program_2.dart';
import 'package:ui/detail_program_3.dart';
import 'package:ui/detail_program_4.dart';
import 'package:ui/detail_program_5.dart';
import 'package:ui/detail_program_6.dart';
import 'package:ui/detail_program_7.dart';
import 'package:ui/end_program.dart';
import 'package:ui/login.dart';
import 'package:ui/homepage.dart';
import 'package:ui/panduan_skincare.dart';
import 'package:ui/profile_page.dart';
import 'package:ui/reset_password.dart';
import 'package:ui/reset_password_confirm.dart';
import 'package:ui/sign_up.dart';
import 'package:ui/edit_profile.dart';
import 'package:ui/splash_screen.dart';
import 'package:ui/get_started.dart';
import 'package:ui/WeeklyProgress_Screen.dart';
import 'package:ui/prep_antiaging.dart';
import 'package:ui/antiaging_eyelift1.dart';
import 'package:ui/antiaging_eyelift2.dart';
import 'package:ui/antiaging_eyelift3.dart';
import 'package:ui/antiaging_eyelift4.dart';
import 'package:ui/antiaging_eyelift5.dart';
import 'package:ui/antiaging_eyelift6.dart';
import 'package:ui/antiaging_eyelift7.dart';
import 'package:ui/antiaging_pose1.dart';
import 'package:ui/antiaging_pose2.dart';
import 'package:ui/antiaging_pose3.dart';
import 'package:ui/antiaging_pose4.dart';
import 'package:ui/antiaging_pose5.dart';
import 'package:ui/antiaging_pose6.dart';
import 'package:ui/antiaging_pose7.dart';
import 'package:ui/history_screen.dart';
import 'package:ui/latihan_eyelift1.dart';



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
      initialRoute: '/WeeklyProgress_Screen',
      routes: {                
        '/splash_screen': (context) => TampilanAwalScreen(),
        '/get_started': (context) => MemulaiScreen(),
        '/sign_up': (context) => MendaftarPage(),
        '/login': (context) => LoginPage(),
        '/reset_password': (context) => ResetPasswordPage(),
        '/reset_password_confirm': (context) => ResetPasswordScreen(),
        //beranda
        '/homepage': (context) => ProgramHomepage(),
        //profil
        '/profile_page': (context) => ProfilePage(),
        '/edit_profile': (context) => EditProfilPage(),

        '/history_screen':(context)=> HistoryScreen(),
        '/WeeklyProgress_Screen':(context) => ProgramWaktuScreen(),
        '/prep_antiaging':(context)=> PersiapanAntiAging(),
        '/antiaging_eyelift1':(context)=> AntiAgingEyeLift1(),
        '/antiaging_eyelift2':(context)=> AntiAgingEyeLift2(),
        '/antiaging_eyelift3':(context)=> AntiAgingEyeLift3(),
        '/antiaging_eyelift4':(context)=> AntiAgingEyeLift4(),
        '/antiaging_eyelift5':(context)=> AntiAgingEyeLift5(),
        '/antiaging_eyelift6':(context)=> AntiAgingEyeLift6(),
        '/antiaging_eyelift7':(context)=> AntiAgingEyeLift7(),
        '/antiaging_pose1':(context)=> AntiAgingPose1(),
        '/antiaging_pose2':(context)=> AntiAgingPose2(),
        '/antiaging_pose3':(context)=> AntiAgingPose3(),
        '/antiaging_pose4':(context)=> AntiAgingPose4(),
        '/antiaging_pose5':(context)=> AntiAgingPose5(),
        '/antiaging_pose6':(context)=> AntiAgingPose6(),
        '/antiaging_pose7':(context)=> AntiAgingPose7(),
        '/latihan_eyelift1' : (context)=> LatihanEyeLift1(),
        

        //program eksternal
        '/detail_program_1' : (context) => DetailProgram1(),
        '/detail_program_2' : (context) => DetailProgram2(),
        '/detail_program_3' : (context) => DetailProgram3(),
        '/detail_program_4' : (context) => DetailProgram4(),
        '/detail_program_5' : (context) => DetailProgram5(),
        '/detail_program_6' : (context) => DetailProgram6(),
        '/detail_program_7' : (context) => DetailProgram7(),

        //panduan skincare
        'panduan_skincare' : (context) => PanduanSkincare(),

        //program selesai
        '/program_selesai': (context) => ProgramBerakhirScreen(),
      },
    );
  }
}
