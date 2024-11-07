import 'package:flutter/material.dart';
import 'package:ui/login.dart';
import 'package:ui/homepage.dart';

// Define color constants to match ProgramHomepage
const Color primaryColor = Color(0xFFB258D6); // Darker purple color from ProgramHomepage
const Color secondaryColor = Color(0xFFD1A3FF); // Lighter purple color from ProgramHomepage
const Color snackbarSuccessColor = Colors.green;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController usernameController = TextEditingController(text: "user01");
  final TextEditingController emailController = TextEditingController(text: "email@contoh.com");
  final TextEditingController genderController = TextEditingController(text: "Perempuan");
  final TextEditingController birthDateController = TextEditingController(text: "01/01/2000");
  final TextEditingController skinTypeController = TextEditingController(text: "Kulit Normal");
  int _selectedIndex = 1; // Default to Profile page

  void _showConfirmationDialog(String title, String content, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content, textAlign: TextAlign.justify),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor, foregroundColor: Colors.white),
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

  void _showDeleteConfirmationDialog() {
    _showConfirmationDialog(
      'Pengingat Keamanan',
      'Setelah menghapus akun, semua data akan dihapus dan tidak dapat dipulihkan.',
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Akun berhasil dihapus!'),
          backgroundColor: snackbarSuccessColor,
        ));
      },
    );
  }

  void _showLogoutConfirmationDialog() {
    _showConfirmationDialog(
      'Pengingat Keamanan',
      'Apakah anda yakin ingin keluar?',
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Log out berhasil'),
          backgroundColor: snackbarSuccessColor,
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
        title: const Text(
          'Profil Pengguna',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileField(title: 'Nama Pengguna', controller: usernameController),
              ProfileField(title: 'Email', controller: emailController),
              ProfileField(title: 'Jenis Kelamin', controller: genderController),
              ProfileField(title: 'Tanggal Lahir', controller: birthDateController),
              ProfileField(title: 'Jenis Kulit', controller: skinTypeController),
              const SizedBox(height: 20),
              ProfileButton(
                text: 'Ubah Profil',
                color: Color.fromARGB(255, 143, 78, 155),
                onPressed: () => Navigator.pushNamed(context, '/edit_profile'),
              ),
              ProfileButton(
                text: 'Keluar',
                color: Color.fromARGB(255, 143, 78, 155),
                onPressed: _showLogoutConfirmationDialog,
              ),
              ProfileButton(
                text: 'Hapus Akun',
                color: Color.fromARGB(255, 143, 78, 155),
                onPressed: _showDeleteConfirmationDialog,
              ),
            ],
          ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProgramHomepage()),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  ProfileField({required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          TextFormField(
            controller: controller,
            readOnly: true,
            style: const TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              hintText: 'Masukkan $title',
              hintStyle: const TextStyle(color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}

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
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}