import 'package:calandermm/Model/day.dart';
import 'package:calandermm/Presentation/Scheduling_page.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  List<DaySchedule> schedule = [
    DaySchedule('Sun'),
    DaySchedule('Mon'),
    DaySchedule('Tue'),
    DaySchedule('Wed'),
    DaySchedule('Thu'),
    DaySchedule('Fri'),
    DaySchedule('Sat'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff273F64),
          title: Text(
            "Welcome to The Calander App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                style: TextStyle(fontWeight: FontWeight.bold),
                generateScheduleText(),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          ElevatedButton(
            onPressed: () async {
              var updatedSchedule = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Schedulingpage(
                    initialSchedule: schedule,
                  ),
                ),
              );

              if (updatedSchedule != null) {
                setState(() {
                  schedule = updatedSchedule;
                });
              }
            },
            child: Text(
              schedule.isEmpty ? 'Add Schedule' : 'Edit Schedule',
            ),
          ),
        ]),
      ),
    );
  }

  String generateScheduleText() {
    List<String> availableDays = [];

    for (var day in schedule) {
      if (day.timeSlots.isNotEmpty) {
        availableDays.add('${day.day} ${day.timeSlots.join(', ')}');
      }
    }

    if (availableDays.isEmpty) return "You haven't set your availability yet.";

    return 'Hi, you are available on ' + availableDays.join(', ') + '.';
  }
}
