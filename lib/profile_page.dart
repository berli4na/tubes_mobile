import 'package:flutter/material.dart';
// Import halaman login Anda
import 'package:ui/login.dart'; // Pastikan ini sesuai dengan nama file halaman login Anda

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
  int _selectedIndex = 1; // Set default to Profile page

  @override
  void initState() {
    super.initState();
    usernameController.text = "Nama Pengguna";
    emailController.text = "email@contoh.com";
    genderController.text = "Perempuan";
    birthDateController.text = "01/01/2000";
    skinTypeController.text = "Kulit Normal";
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pengingat Keamanan'),
          content: Text('Setelah menghapus akun, semua data akan dihapus dan tidak dapat dipulihkan.'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
            style: TextButton.styleFrom(backgroundColor: Color(0xFF9C4DCC), foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Akun berhasil dihapus!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text('Oke'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pengingat Keamanan'),
          content: Text('Apakah anda yakin ingin keluar?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
            style: TextButton.styleFrom(backgroundColor: Color(0xFF9C4DCC), foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Log out berhasil'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text('Oke'),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Handle navigation based on selected index
      // You can add your navigation logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1A3FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF9C4DCC),
        title: Text(
          'Profil Pengguna',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileField(title: 'Nama Pengguna', controller: usernameController, readOnly: true),
              ProfileField(title: 'Email', controller: emailController, readOnly: true),
              ProfileField(title: 'Jenis Kelamin', controller: genderController, readOnly: true),
              ProfileField(title: 'Tanggal Lahir', controller: birthDateController, readOnly: true),
              ProfileField(title: 'Jenis Kulit', controller: skinTypeController, readOnly: true),
              SizedBox(height: 20),
              ProfileButton(text: 'Ubah Profil', color: Color(0xFF9C4DCC)),
              ProfileButton(text: 'Keluar', color: Color(0xFF9C4DCC), onPressed: _showLogoutConfirmationDialog),
              ProfileButton(text: 'Hapus Akun', color: Color(0xFF9C4DCC), onPressed: _showDeleteConfirmationDialog),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF9C4DCC),
        onTap: _onItemTapped,
      ),
    );
  }
}

// Definisi ProfileField
class ProfileField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool readOnly;

  ProfileField({required this.title, required this.controller, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              hintText: 'Masukkan $title',
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}

// Definisi ProfileButton
class ProfileButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  ProfileButton({required this.text, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: onPressed ?? () {},
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
