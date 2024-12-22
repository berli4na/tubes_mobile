import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LatihanEyeLift1(), // Atur halaman pertama yang langsung ditampilkan
    );
  }
}

class LatihanEyeLift1 extends StatefulWidget {
  @override
  _LatihanEyeLift1State createState() => _LatihanEyeLift1State();
}

class _LatihanEyeLift1State extends State<LatihanEyeLift1> {
  int seconds = 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void addTime() {
    setState(() {
      seconds += 15;
    });
  }

  void skip() {
    timer?.cancel();
    setState(() {
      seconds = 0;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100], // Background color
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Center(
                child: const Text(
                  "Letakkan jari telunjuk di bawah alis dan jari tengah di bawah mata, membentuk huruf “V”.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Timer
              Stack(
                alignment: Alignment.center,
                children: [
                  // Circular Timer
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: seconds / 10, // Hitung mundur dari 10
                      strokeWidth: 8,
                      backgroundColor: Colors.grey,
                      color: Colors.red,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$seconds\"",
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "SEC",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add Time Button
                  ElevatedButton(
                    onPressed: addTime,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "+15s",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Skip Button
                  TextButton(
                    onPressed: skip,
                    child: const Text(
                      "MELEWATI",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman baru menggunakan Navigator.push
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            "SELANJUTNYA",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Kedua"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          "Ini adalah halaman kedua",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
