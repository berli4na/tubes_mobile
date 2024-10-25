import 'package:flutter/material.dart';

class ProgramTigaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  //Navigator.pushNamed(context, '/beranda');
                },
              ),
            ),
            // Menggunakan Column dengan MainAxisAlignment.center
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Memastikan kolom berada di tengah
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/model3.png'), // Path ke gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Yoga Wajah: Mempertegas rahang',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 78, 155),
                  ),
                  textAlign: TextAlign.center, // Menjaga teks berada di tengah
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Teknik ini membantu kamu dapetin rahang impian tanpa filler atau operasi! Gerakan ini efektif mengencangkan otot di area rahang dan leher, bikin wajah terlihat lebih terdefinisi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Rasakan perubahan rahang yang makin tajam dan garis wajah makin keren!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 143, 78, 155),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.timer, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        '7 menit per sesi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFF2E4F8)),
                        child: Column(
                          children: [
                            BenefitItem(text: 'Membentuk garis rahang yang lebih tegas'),
                            BenefitItem(text: 'Mengurangi lemak berlebih di sekitar dagu dan pipi, membuat wajah terlihat lebih tirus'),
                            BenefitItem(text: 'Mengurangi double chin'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.pushNamed(context, '/persiapan_skincare');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color.fromARGB(255, 143, 78, 155),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 30.0),
                      ),
                      minimumSize: Size(double.infinity, 50), // Memastikan tombol selebar layar
                    ),
                    child: Text(
                      "Mulai",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BenefitItem extends StatelessWidget {
  final String text;

  BenefitItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Menyelaraskan item di atas
        children: [
          Image.asset('images/Check.png'),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify, // Mengatur teks menjadi rata kanan kiri
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}