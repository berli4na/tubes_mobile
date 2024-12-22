import 'package:flutter/material.dart';
import 'package:ui/articles_page.dart';
import 'package:ui/login.dart';
import 'package:ui/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'session.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController skinTypeController = TextEditingController();

  int _selectedIndex = 2; // Default to Profile page

  @override
  void initState() {
    super.initState();
    data(); // Memuat data saat halaman dimulai
  }

  Future<void> data() async {
    String? docId = await getData('session');
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(docId).get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      if (data != null) {
        setState(() {
          usernameController.text = data['name'];
          emailController.text = data['email'];
          genderController.text = data['gender'];
          birthDateController.text = data['birthDate'];
          skinTypeController.text = data['skinType'];
        });
      } else {
        print('No data found');
      }
    } else {
      print('Document does not exist');
    }
  }

  void _navigateToEditProfile() async {
    final result = await Navigator.pushNamed(context, '/edit_profile');
    String? docId = await getData('session');
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(docId).get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      if (data != null) {
        setState(() {
          usernameController.text = data['name'];
          emailController.text = data['email'];
          genderController.text = data['gender'];
          birthDateController.text = data['birthDate'];
          skinTypeController.text = data['skinType'];
        });
      } else {
        print('No data found');
      }
    } else {
      print('Document does not exist');
    }
  }

  void _showConfirmationDialog(
      String title, String content, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content, textAlign: TextAlign.justify),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 143, 78, 155),
                  foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
              child: const Text('Oke'),
            ),
          ],
        );
      },
    );
  }

  void _deleteProfile() async {
    try {
      // Mendapatkan docId pengguna dari sesi
      String? docId = await getData('session');

      // Mengecek apakah dokumen pengguna ada di Firestore
      final docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(docId).get();

      if (docSnapshot.exists) {
        // Jika dokumen ada, hapus dokumen dari Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docId)
            .delete();

        print('User data deleted successfully');

        // Navigasi ke halaman login setelah penghapusan berhasil
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );

        // Menampilkan pesan berhasil
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Akun berhasil dihapus!'),
          backgroundColor: Colors.green,
        ));
      } else {
        print('Document does not exist');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Data pengguna tidak ditemukan.'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      // Menangani error jika proses penghapusan gagal
      print('Failed to delete user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gagal menghapus data pengguna: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Penghapusan'),
          content: const Text('Apakah Anda yakin ingin menghapus akun? '
              'Semua data Anda akan hilang dan tidak dapat dipulihkan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Tutup dialog dan tetap di halaman profil
              },
              child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 143, 78, 155),
                  foregroundColor: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tidak'),
            ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 143, 78, 155),
                  foregroundColor: Colors.white),
             onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _deleteProfile(); // Panggil fungsi penghapusan akun
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmationDialog() {
    _showConfirmationDialog(
      'Pengingat Keamanan',
      'Apakah anda yakin ingin keluar?',
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Log out berhasil'),
          backgroundColor: Colors.green,
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
        centerTitle: true, // Untuk menempatkan teks di tengah
        automaticallyImplyLeading: false, // Menghilangkan ikon back arrow
        title: Center(
          child: Text(
            'Profil Pengguna',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white, // Mengatur warna teks menjadi putih
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 190, 231),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            ListTile(
              leading: Icon(Icons.person, color: Colors.purple[700]),
              title: Text('Nama Pengguna'),
              subtitle: Text(usernameController.text),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.purple[700]),
              title: Text('Email'),
              subtitle: Text(emailController.text),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.purple[700]),
              title: Text('Jenis Kelamin'),
              subtitle: Text(genderController.text),
            ),
            ListTile(
              leading: Icon(Icons.cake, color: Colors.purple[700]),
              title: Text('Tanggal Lahir'),
              subtitle: Text(birthDateController.text),
            ),
            ListTile(
              leading: Icon(Icons.spa, color: Colors.purple[700]),
              title: Text('Jenis Kulit'),
              subtitle: Text(skinTypeController.text),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[400],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _navigateToEditProfile,
                child: const Text(
                  'Edit Profil',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[400],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _showLogoutConfirmationDialog,
                child: const Text(
                  'Keluar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[400],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _showDeleteConfirmationDialog,
                child: const Text(
                  'Hapus Akun',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purple[100],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            // Navigasi ke homepage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProgramHomepage()),
            );
          } else if (index == 1) {
            // Navigasi ke profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArticlesPage()),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
