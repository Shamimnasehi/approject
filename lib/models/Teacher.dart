class Teacher {
  final String name;
  final String lastname;
  final String teacherId;
  final String username;
  final String password;

  Teacher ({
    required this.name,
    required this.lastname,
    required this.teacherId,
    required this.username,
    required this.password,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    name: json['name'],
    lastname: json['lastname'],
    teacherId: json['teacher id'],
    username: json['username'],
    password: json['password'],
  );
}