import 'package:flutter/material.dart';

class DetailProgramDuaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/persiapan_skincare');
          },
        ),
        backgroundColor: Colors.purple[100],
      ),
      body: Column(
        children: [
          // Container untuk judul
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Yoga Wajah: Menghilangkan Garis Senyum',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 143, 78, 155),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 16.0), // Margin atas untuk jarak dengan judul
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Warna bayangan dengan transparansi
                    offset: Offset(0, 2), // Posisi bayangan
                    blurRadius: 4.0, // Radius blur bayangan
                  ),
                ],
              ),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ExerciseStep(
                    stepNumber: 1,
                    stepText: "Tarik kedua sudut bibir dengan jari tengah.",
                  ),
                  ExerciseStep(
                    stepNumber: 2,
                    stepText: "Kencangkan kulit diarea dalam, lalu tahan selama 10 detik.",
                  ),
                  ExerciseStep(
                    stepNumber: 3,
                    stepText: "Ulangi langkah tersebut sebanyak 25 kali.",
                  ),
                  ExerciseStep(
                    stepNumber: 4,
                    stepText: "Selanjutnya tarik nafas dalam-dalam melalui mulut.",
                  ),
                  ExerciseStep(
                    stepNumber: 5,
                    stepText: "Tahan dalam posisi mulut menggembung.",
                  ),
                  ExerciseStep(
                    stepNumber: 6,
                    stepText: "Selagi menahan nafas, pindahkan udara dalam mulut dari satu sisi ke sisi lain.",
                  ),
                  ExerciseStep(
                    stepNumber: 7,
                    stepText: "Hembuskan nafas dan ulangi langkah tersebut sebanyak 10 kali.",
                  ),
                  ExerciseStep(
                    stepNumber: 8,
                    stepText: "Selanjutnya letakkan kedua telapak tangan di pipi dan pastikan jari-jari tangangn menyentuh tepian wajah.",
                  ),
                  ExerciseStep(
                    stepNumber: 9,
                    stepText: "Tarik kedua sudut bibir sampai gigi kelihatan dan tahan selama 30 detik.",
                  ),
                  ExerciseStep(
                    stepNumber: 10,
                    stepText: "Lepaskan dan ulangi kembali proses yang sama sebanyak tiga kali.",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/program_selesai');// Aksi ketika tombol selesai ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromARGB(255, 143, 78, 155), // Mengubah warna latar belakang menjadi putih
                side: BorderSide(color:Color.fromARGB(255, 143, 78, 155), width: 1), // Menambahkan border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(double.infinity, 50), // Memastikan tombol selebar layar
              ),
              child: Text(
                "Selesai",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white, // Mengubah warna teks agar kontras
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseStep extends StatelessWidget {
  final int stepNumber;
  final String stepText;

  ExerciseStep({required this.stepNumber, required this.stepText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color.fromARGB(255, 143, 78, 155),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color.fromARGB(255, 143, 78, 155),
            child: Text(
              stepNumber.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              stepText,
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}