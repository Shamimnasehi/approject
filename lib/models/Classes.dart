class Classes {
  final String subject;
  final String teachersName;
  final DateTime time;
  bool isPassed = false;
  bool isHappening = false;

  Classes({required this.subject, required this.teachersName, required this.time});
}

List<Classes> classes = [
  Classes(
    subject: "Math",
    teachersName: "Ali",
    time: DateTime.parse("2020-06-05 10:30:00"),
  ),
  Classes(
    subject: "Physics",
    teachersName: "Rezaee",
    time: DateTime.parse("2020-06-05 11:30:00"),
  ),
  Classes(
    subject: "German",
    teachersName: "Mohammad",
    time: DateTime.parse("2020-06-05 12:30:00"),
  ),
];