import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PanduanSkincare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Rekomendasi Skincare', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[100],
      ),
      backgroundColor: Colors.purple[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rekomendasi Skincare untuk Semua Jenis Kulit',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 143, 78, 155),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Sebelum melakukan yoga wajah, penting untuk menyiapkan kulit Anda dengan produk skincare yang tepat. Berikut adalah rekomendasi produk yang cocok untuk semua jenis kulit:',
                style: GoogleFonts.poppins(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              _buildProductSection(
                title: 'Pelembap',
                products: [
                  _Product(name: 'SKINTIFIC', imagePath: 'images/Skintific.jpg'), // Ganti dengan nama dan gambar produk
                  _Product(name: 'SOMETHINC', imagePath: 'images/Somethinc.jpg'), // Ganti dengan nama dan gambar produk
                  _Product(name: 'OLAY', imagePath: 'images/Olay.jpg'), // Ganti dengan nama dan gambar produk
                ],
              ),
              _buildProductSection(
                title: 'Masker Wajah',
                products: [
                  _Product(name: 'Azarine Purifying Deep Cleansing Clay Mask ', imagePath: 'images/Azarine.jpg'), // Ganti dengan nama dan gambar produk
                  _Product(name: 'Wardah Nature Daily Mineral Clarifying Clay Mask', imagePath: 'images/Wardah.jpg'), // Ganti dengan nama dan gambar produk
                ],
              ),
              _buildProductSection(
                title: 'Lotion',
                products: [
                  _Product(name: 'Laikou Japan Sakura Lotion', imagePath: 'images/Lotion.jpg'), // Ganti dengan nama dan gambar produk
                ],
              ),
              _buildProductSection(
                title: 'Scrub Wajah',
                products: [
                  _Product(name: 'Safi Age Defy Anti Aging Deep Exfoliator Face Scrub productnation', imagePath: 'images/Scrub.jpg'), // Ganti dengan nama dan gambar produk
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Langkah Persiapan Sebelum Face Yoga',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 143, 78, 155),
                ),
              ),
              SizedBox(height: 20),
              _buildPreparationStep('images/cucimuka.png', 'Bersihkan Wajah', 'Pastikan wajah bersih dari kotoran dan makeup.'),
              _buildPreparationStep('images/pakaicream.png', 'Oleskan Toner', 'Toner membantu menyiapkan kulit untuk menerima produk selanjutnya.'),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 143, 78, 155),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection({required String title, required List<_Product> products}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 143, 78, 155),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: products.map((product) => _buildProductCard(product.imagePath, product.name)).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProductCard(String imagePath, String label) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            SizedBox(width: 10),
            Expanded(
              child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreparationStep(String imagePath, String label, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Text(description, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Product {
  final String name;
  final String imagePath;

  _Product({required this.name, required this.imagePath});
}