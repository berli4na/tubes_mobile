import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProgramWaktuScreen(),
      routes: {
        '/week_1_screen': (context) => Week1Screen(),
        '/week_2_screen': (context) => Week2Screen(),
        '/week_3_screen': (context) => Week3Screen(),
        '/week_4_screen': (context) => Week4Screen(),
        '/day_detail_screen': (context) => DayDetailScreen(),
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

  int? selectedWeek;
  int? selectedDay;

  void toggleProgress(int week, int day) {
    setState(() {
      progress[week][day] = !progress[week][day];
      selectedWeek = week;
      selectedDay = day;
    });
  }

  void navigateToNextIncompleteWeek() {
    if (selectedWeek != null && selectedDay != null) {
      navigateToScreen(selectedWeek!, selectedDay!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pilih hari terlebih dahulu!")),
      );
    }
  }

  void navigateToScreen(int week, int day) {
    String route = '';

    if (week == 1) {
      route = '/week_1_screen';
    } else if (week == 2) {
      route = '/week_2_screen';
    } else if (week == 3) {
      route = '/week_3_screen';
    } else if (week == 4) {
      route = '/week_4_screen';
    }

    if (route.isNotEmpty) {
      Navigator.pushNamed(
        context,
        route,
        arguments: {'week': week, 'day': day},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                        Navigator.pushReplacementNamed(context, '/prep_antiaging');
                      },
                    ),
                    Text(
                      '28 Hari Tersisa',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.white),
                  onPressed: () {
                    // Your calendar icon action
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return WeeklyProgressCard(
                  week: index + 1,
                  progress: progress[index],
                  onTap: toggleProgress,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: navigateToNextIncompleteWeek,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 143, 78, 155),
                side: BorderSide(color: Color.fromARGB(255, 143, 78, 155), width: 1),
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

class WeeklyProgressCard extends StatelessWidget {
  final int week;
  final List<bool> progress;
  final Function(int week, int day) onTap;

  const WeeklyProgressCard({required this.week, required this.progress, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(7, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman detail hari
                        Navigator.pushNamed(
                          context,
                          '/day_detail_screen',
                          arguments: {'week': week, 'day': index},
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: progress[index] ? Colors.green : Colors.grey[300],
                        child: progress[index]
                            ? Icon(Icons.check, color: Colors.white)
                            : Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB', 'MIN']
                      .map((day) => Text(
                            day,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Week1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final week = args?['week'] ?? 1;
    final day = args?['day'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Week 1 Screen')),
      body: Center(child: Text('Details for Week $week, Day $day')),
    );
  }
}

class Week2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final week = args?['week'] ?? 2;
    final day = args?['day'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Week 2 Screen')),
      body: Center(child: Text('Details for Week $week, Day $day')),
    );
  }
}

class Week3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final week = args?['week'] ?? 3;
    final day = args?['day'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Week 3 Screen')),
      body: Center(child: Text('Details for Week $week, Day $day')),
    );
  }
}

class Week4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final week = args?['week'] ?? 4;
    final day = args?['day'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Week 4 Screen')),
      body: Center(child: Text('Details for Week $week, Day $day')),
    );
  }
}

class DayDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final week = args?['week'] ?? 1;
    final day = args?['day'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Detail for Week $week, Day $day')),
      body: Center(child: Text('Detail content for Week $week, Day $day')),
    );
  }
}
