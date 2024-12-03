import 'package:flutter/material.dart';

class DetailProgramSatuScreen extends StatelessWidget {
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
              'Yoga Wajah: Menghilangkan Kantung Mata',
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
                    stepText: "Siapkan Eye Cream atau Face Oil (Optional). Pastikan tangan anda bersih sebelumnya. ",
                  ),
                  ExerciseStep(
                    stepNumber: 2,
                    stepText: "Buat huruf 'V' dengan jari telunjuk dan jari tengah seperti simbol kemenangan (peace).",
                  ),
                  ExerciseStep(
                    stepNumber: 3,
                    stepText: "Biarkan bentuk V ini berada di bawah mata kedua mata",
                  ),
                  ExerciseStep(
                    stepNumber: 4,
                    stepText: "Biarkan ujung kedua jari menyentuh sudut mata Anda.",
                  ),
                  ExerciseStep(
                    stepNumber: 5,
                    stepText: "Sekarang lihat ke atas sambil memegang jari-jari erat-erat di kulit. Jangan gerakkan dagu ke atas.",
                  ),
                  ExerciseStep(
                    stepNumber: 6,
                    stepText: "Tutup setengah mata Anda, seolah-olah Anda sedang menyipitkan mata.",
                  ),
                  ExerciseStep(
                    stepNumber: 7,
                    stepText: "Rasakan otot-otot menggigil dan kelopak mata bergetar. Tahan posisi ini selama 5 detik.",
                  ),
                  ExerciseStep(
                    stepNumber: 8,
                    stepText: "Lepaskan dan ulangi sebanyak yang Anda inginkan.",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/program_selesai');
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
