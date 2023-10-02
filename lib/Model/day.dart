class DaySchedule {
  final String day;
  bool available = false; // to track availability
  List<String> timeSlots = [];

  DaySchedule(this.day);
}
