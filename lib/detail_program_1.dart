import 'package:flutter/material.dart';
import 'dart:async';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailProgram1 extends StatefulWidget {
  @override
  _DetailProgram1State createState() => _DetailProgram1State();
}

class _DetailProgram1State extends State<DetailProgram1> {
  Timer? _timer;
  int _currentStep = 0;
  int _countdownTime = 0;

  final List<Map<String, dynamic>> _steps = [
    {'stepText': "Bersihkan wajah dengan air hangat dan gunakan pelembap wajah agar kulit tetap elastis.", 'duration': 20},
    {'stepText': "Gunakan ujung jari telunjuk dan tengah kedua tangan untuk memijat area di antara alis secara lembut.", 'duration': 15},
    {'stepText': "Mulailah dengan menekan kedua jari secara perlahan di area glabellar (antara kedua alis).", 'duration': 10},
    {'stepText': "Gerakkan jari secara horizontal ke arah luar, sambil memberi sedikit tekanan.", 'duration': 10},
    {'stepText': "Lakukan gerakan ini selama 30 detik – 1 menit.", 'duration': 30},
    {'stepText': "Ulangi gerakan dengan pola melingkar kecil ke arah yang sama selama 30 detik.", 'duration': 30},
    {'stepText': "Berikan pijatan akhir dengan teknik menepuk lembut menggunakan jari tengah selama 15 detik.", 'duration': 15},
  ];

  void _startCountdown() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_currentStep < _steps.length) {
      setState(() {
        _countdownTime = _steps[_currentStep]['duration'];
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownTime > 0) {
            _countdownTime--;
          } else {
            timer.cancel();
            _moveToNextStep();
          }
        });
      });
    }
  }

  void _moveToNextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
      _startCountdown();
    } else {
      Navigator.pushNamed(context, '/program_selesai');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
        ),
        backgroundColor: Colors.purple[100],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yoga Wajah: Menghilangkan Kerutan Di Antara Alis',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 143, 78, 155),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _startCountdown,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 143, 78, 155),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: Size(120, 40),
                      ),
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayVideoTutorial()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 143, 78, 155),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: Size(120, 40),
                      ),
                      child: Text(
                        "Video Tutorial",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.purple[200],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _countdownTime > 0 ? _countdownTime.toString() : "",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  return ExerciseStep(
                    stepNumber: index + 1,
                    stepText: _steps[index]['stepText'],
                    durationText: "${_steps[index]['duration']} detik",
                    isActive: _currentStep == index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayVideoTutorial extends StatefulWidget {
  const PlayVideoTutorial({super.key});

  @override
  State<PlayVideoTutorial> createState() => _PlayVideoTutorialState();
}

class _PlayVideoTutorialState extends State<PlayVideoTutorial> {
  final videoURL = "https://www.youtube.com/watch?v=K50BuCrRRHc";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Video Tutorial",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
      ),
      backgroundColor: Colors.purple[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          YoutubePlayer(controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () => debugPrint('Siap'),
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                playedColor: Colors.purple,
                handleColor: Color.fromARGB(255, 209, 53, 236)
              ),
            ),
          ],
          )
        ],
      ),
    );
  }
}

class ExerciseStep extends StatelessWidget {
  final int stepNumber;
  final String stepText;
  final String durationText;
  final bool isActive;

  ExerciseStep({
    required this.stepNumber,
    required this.stepText,
    required this.durationText,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.purple[100] : Colors.white,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stepText,
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.timer, size: 16.0, color: Colors.grey),
                    SizedBox(width: 4.0),
                    Text(
                      durationText,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}