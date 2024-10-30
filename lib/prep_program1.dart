import 'package:flutter/material.dart';

class ProgramSatuScreen extends StatelessWidget {
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
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
            ),
            // Menggunakan Column dengan MainAxisAlignment.center
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Memastikan kolom berada di tengah
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/model1.jpeg'), // Path ke gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Yoga Wajah: Menghilangkan ',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 78, 155),
                  ),
                  textAlign: TextAlign.center, // Menjaga teks berada di tengah
                ),
                SizedBox(height: 3),
                Text(
                  ' Kantung Mata',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 78, 155),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Yoga ini meningkatkan sirkulasi darah di sekitar area mata, mengurangi tanda-tanda lelah, dan membuat mata menjadi lebih segar. Lakukan secara rutin untuk mendapatkan hasil yang maksimal, Manjakan dirimu dan ikuti tutorial  dasar yoga wajah ini.',
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
                    ' Manjakan dirimu dan ikuti tutorial  dasar yoga wajah ini.',
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
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                        '10 menit per sesi',
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
                            BenefitItem(
                                text: 'Mengencangkan kulit di daerah mata'),
                            BenefitItem(
                                text:
                                    'Menghilangkan bengkak dan membantu menghilangkan kantung mata'),
                            BenefitItem(text: 'Menyegarkan mata lelah '),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/persiapan_skincare1');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 143, 78, 155),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: Size(double.infinity,
                          50), // Memastikan tombol selebar layar
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
        crossAxisAlignment:
            CrossAxisAlignment.start, // Menyelaraskan item di atas
        children: [
          Image.asset('images/Check.png'),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign:
                  TextAlign.justify, // Mengatur teks menjadi rata kanan kiri
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
