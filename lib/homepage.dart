import 'package:flutter/material.dart';
import 'package:ui/profile_page.dart';

class ProgramHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 225, 190, 231),
      body: Column(
        children: [
          // App Bar Container with Logo
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 143, 78, 155),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'images/logo.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Title Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Program Yoga Wajah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 143, 78, 155),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                YogaProgramCard(
                  title: 'Mengurangi Kantong Mata',
                  image: 'images/m1.png',
                  onPressed: () {
                    Navigator.pushNamed(context, '/program_satu');
                  },
                ),
                SizedBox(height: 16),
                YogaProgramCard(
                  title: 'Mengurangi Garis Senyum',
                  image: 'images/mm2.png',
                  onPressed: () {
                    Navigator.pushNamed(context, '/program_dua');
                  },
                ),
                SizedBox(height: 16),
                YogaProgramCard(
                  title: 'Mempertegas Rahang',
                  image: 'images/m3.png',
                  onPressed: () {
                    Navigator.pushNamed(context, '/program_tiga');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 143, 78, 155), // Background color sesuai permintaan
        selectedItemColor: Colors.white, // Warna icon yang dipilih
        unselectedItemColor: Colors.purple[100], 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Navigasi ke halaman profil ketika ikon Profile ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}

class YogaProgramCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPressed;

  const YogaProgramCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
             Color.fromARGB(255, 143, 78, 155), // Darker purple color
           Color.fromARGB(255, 225, 190, 231), // Lighter purple color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 143, 78, 155),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Mulai',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),

            // Image on the Right
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 80, // Adjust width and height as needed
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
