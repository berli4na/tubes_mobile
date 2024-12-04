import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel Yoga Wajah'),
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ArticleItem(
            title: 'Manfaat Yoga Wajah untuk Kecantikan',
            description: 'Temukan bagaimana yoga wajah dapat membantu meningkatkan penampilan kulit Anda.',
            imagePath: 'images/yoga1.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(
                    title: 'Manfaat Yoga Wajah untuk Kecantikan',
                    content: '''
Yoga wajah adalah latihan yang melibatkan berbagai gerakan untuk menguatkan otot-otot wajah, meningkatkan sirkulasi darah, dan mengurangi kerutan. 
Dengan melakukan yoga wajah secara teratur, Anda dapat membantu meningkatkan elastisitas kulit dan memberikan tampilan yang lebih muda dan segar.

Manfaat Yoga Wajah:
1. Mengurangi Kerutan: Membantu mengencangkan kulit dan mengurangi kerutan halus.
2. Meningkatkan Sirkulasi: Gerakan yoga meningkatkan aliran darah ke wajah.
3. Relaksasi: Membantu meredakan stres dan ketegangan di wajah.
4. Meningkatkan Kesehatan Kulit: Membantu kulit terlihat lebih bercahaya dan sehat.
''',
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          ArticleItem(
            title: '5 Teknik Yoga Wajah yang Harus Anda Coba',
            description: 'Pelajari teknik-teknik yoga wajah yang efektif untuk mengurangi tanda-tanda penuaan.',
            imagePath: 'images/yogaa2.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(
                    title: '5 Teknik Yoga Wajah yang Harus Anda Coba',
                    content: '''
Berikut adalah lima teknik yoga wajah yang dapat Anda praktikkan di rumah untuk mendapatkan wajah yang lebih muda dan segar:

1. Pijatan Dahi: Gunakan jari telunjuk dan jari tengah untuk memijat dahi dengan gerakan melingkar.
2. Gerakan Bibir: Cobalah untuk menggerakkan bibir Anda ke atas dan ke bawah secara bergantian.
3. Pijatan Pipi: Gunakan telapak tangan untuk memijat pipi dari sudut luar ke arah hidung.
4. Latihan Leher: Putar leher Anda perlahan untuk merelaksasi otot-otot di sekitar rahang.
5. Pijatan Mata: Gunakan jari manis untuk memijat area di sekitar mata dengan lembut.
''',
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          ArticleItem(
            title: 'Panduan Lengkap Perawatan Kulit dengan Yoga Wajah',
            description: 'Ikuti panduan lengkap untuk merawat kulit wajah Anda dengan yoga.',
            imagePath: 'images/yogaa3.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(
                    title: 'Panduan Lengkap Perawatan Kulit dengan Yoga Wajah',
                    content: '''
Perawatan kulit tidak hanya bergantung pada produk, tetapi juga pada teknik yang Anda gunakan. Yoga wajah dapat menjadi bagian penting dari rutinitas perawatan kulit Anda. Berikut adalah langkah-langkah untuk memulai:

1. Persiapkan Wajah: Bersihkan wajah Anda dari makeup dan kotoran.
2. Pilih Teknik: Tentukan teknik yoga wajah yang ingin Anda lakukan sesuai kebutuhan kulit Anda.
3. Lakukan Secara Teratur: Cobalah untuk melakukan yoga wajah setiap hari selama 10-15 menit.
4. Kombinasikan dengan Produk: Gunakan serum atau minyak wajah saat melakukan pijatan untuk hasil yang lebih baik.

Dengan mengikuti panduan ini, Anda dapat memaksimalkan manfaat yoga wajah dan mendapatkan kulit yang lebih sehat dan bercahaya.
''',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


class ArticleItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  ArticleItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar artikel
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String content;

  ArticleDetailPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}