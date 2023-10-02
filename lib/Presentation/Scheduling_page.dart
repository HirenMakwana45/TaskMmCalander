import 'package:calandermm/Model/day.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class Schedulingpage extends StatefulWidget {
  final List<DaySchedule> initialSchedule;

  const Schedulingpage({required this.initialSchedule, super.key});

  @override
  State<Schedulingpage> createState() => _SchedulingpageState();
}

class _SchedulingpageState extends State<Schedulingpage> {
  List<DaySchedule>? schedule;

  void initState() {
    super.initState();
    schedule = List.from(widget.initialSchedule);

    print('Number of items in schedule: ${schedule!.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Your Weekly Hours')),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: schedule!.length,
              itemBuilder: (context, index) {
                final daySchedule = schedule![index];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: daySchedule.available ? Colors.green : Colors.grey,
                    ),
                    Text(daySchedule.day),
                    CustomCheckBoxGroup(
                      autoWidth: true,
                      spacing: 0,
                      buttonLables: ["Morning", "Afternoon", "Evening"],
                      buttonValuesList: ["Morning", "Afternoon", "Evening"],
                      checkBoxButtonValues: (values) {
                        setState(() {
                          daySchedule.available = values.isNotEmpty;
                          daySchedule.timeSlots = values;
                        });
                      },
                      defaultSelected: daySchedule.timeSlots,
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Color(0xff273F64),
                          unSelectedColor: Color.fromARGB(255, 137, 149, 166)),
                      selectedColor: Colors.transparent,
                      unSelectedColor: Colors.transparent,
                      selectedBorderColor: Color(0xff273F64),
                      unSelectedBorderColor: Colors.grey,
                      enableShape: true,
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            width: 270,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff273F64)),
                onPressed: () {
                  Navigator.pop(context, schedule);
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
