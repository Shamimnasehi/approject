class Homework {
  final String title;
  final DateTime dueTime;
  bool isDone = false;
  var estimatedTime;

  Homework({required this.title, required this.dueTime});
}

List<Homework> recentHomeworks = [
  Homework(title: "Planimetric", dueTime: DateTime.parse("2020-06-08 10:30:00"),),
  Homework(title: "Exercises", dueTime: DateTime.parse("2020-06-05 12:30:00"),),
];