import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ProgramWaktuScreen(),
        '/day_detail_screen': (context) => DayDetailScreen(),
        '/antiaging_eyelift1': (context) => AntiAgingEyeLiftScreen(day: 1),
        '/antiaging_eyelift2': (context) => AntiAgingEyeLiftScreen(day: 2),
        '/antiaging_eyelift3': (context) => AntiAgingEyeLiftScreen(day: 3),
        '/antiaging_eyelift4': (context) => AntiAgingEyeLiftScreen(day: 4),
        '/antiaging_eyelift5': (context) => AntiAgingEyeLiftScreen(day: 5),
        '/antiaging_eyelift6': (context) => AntiAgingEyeLiftScreen(day: 6),
        '/antiaging_eyelift7': (context) => AntiAgingEyeLiftScreen(day: 7),
        '/antiaging_pose': (context) => AntiAgingPoseScreen(day: 1),
        '/antiaging_pose2': (context) => AntiAgingPoseScreen(day: 2),
        '/antiaging_pose3': (context) => AntiAgingPoseScreen(day: 3),
        '/antiaging_pose4': (context) => AntiAgingPoseScreen(day: 4),
        '/antiaging_pose5': (context) => AntiAgingPoseScreen(day: 5),
        '/antiaging_pose6': (context) => AntiAgingPoseScreen(day: 6),
        '/antiaging_pose7': (context) => AntiAgingPoseScreen(day: 7),
      },
    );
  }
}

class ProgramWaktuScreen extends StatefulWidget {
  @override
  _ProgramWaktuScreenState createState() => _ProgramWaktuScreenState();
}

class _ProgramWaktuScreenState extends State<ProgramWaktuScreen> {
  List<List<bool>> progress = List.generate(
    4,
    (index) => List.generate(7, (index) => false), // 4 pekan, 7 hari per pekan
  );

  void navigateToNextIncompleteDay() {
    for (int week = 0; week < progress.length; week++) {
      for (int day = 0; day < progress[week].length; day++) {
        if (!progress[week][day]) {
          navigateToScreen(week + 1, day + 1);
          return;
        }
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Semua hari sudah selesai!")),
    );
  }

  void navigateToScreen(int week, int day) {
    String routeName = getRouteName(week, day);

    Navigator.pushNamed(
      context,
      routeName,
      arguments: {'week': week, 'day': day},
    ).then((_) {
      // Update progress after coming back from the day detail screen
      setState(() {
        progress[week - 1][day - 1] = true;
      });
    });
  }

  String getRouteName(int week, int day) {
    // Logic to determine the correct route based on the week and day
    if (week == 1 || week == 3) {
      // Anti-Aging Eye Lift routes for week 1 and week 3
      return '/antiaging_eyelift$day';
    } else if (week == 2 || week == 4) {
      // Anti-Aging Pose routes for week 2 and week 4
      return '/antiaging_pose$day';
    } else {
      return '/day_detail_screen'; // Default route for other days
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with remaining days
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color.fromARGB(255, 143, 78, 155),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                              Navigator.pushNamed(context, '/prep_antiaging');
                            },
                    ),
                    Text(
                      '30 Hari Tersisa',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Week list
          Expanded(
            child: ListView.builder(
              itemCount: progress.length,
              itemBuilder: (context, index) {
                return WeekSection(
                  week: index + 1,
                  progress: progress[index],
                  onDayTap: (day) {
                    navigateToScreen(index + 1, day + 1);
                  },
                );
              },
            ),
          ),

          // GO! button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: navigateToNextIncompleteDay,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 143, 78, 155),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "GO!",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeekSection extends StatelessWidget {
  final int week;
  final List<bool> progress;
  final Function(int day) onDayTap;

  const WeekSection({
    required this.week,
    required this.progress,
    required this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PEKAN $week',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Progress row
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(7, (index) {
                    return DayButton(
                      day: index + 1,
                      isCompleted: progress[index],
                      onTap: () => onDayTap(index),
                    );
                  }),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  final int day;
  final bool isCompleted;
  final VoidCallback onTap;

  const DayButton({
    required this.day,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isCompleted ? Colors.green : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        '$day',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Day Detail Screen
class DayDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final week = args?['week'] ?? 1;
    final day = args?['day'] ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pekan $week, Hari $day'),
      ),
      body: Center(
        child: Text(
          'Konten detail untuk Pekan $week, Hari $day',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Anti-Aging Eye Lift Screen
class AntiAgingEyeLiftScreen extends StatelessWidget {
  final int day;
  const AntiAgingEyeLiftScreen({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anti-Aging Eye Lift - Hari $day'),
      ),
      body: Center(
        child: Text(
          'Konten Anti-Aging Eye Lift untuk Hari $day',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Anti-Aging Pose Screen
class AntiAgingPoseScreen extends StatelessWidget {
  final int day;
  const AntiAgingPoseScreen({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anti-Aging Pose - Hari $day'),
      ),
      body: Center(
        child: Text(
          'Konten Anti-Aging Pose untuk Hari $day',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
