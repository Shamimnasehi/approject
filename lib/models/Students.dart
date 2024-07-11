class Students {
  final String name;
  final String lastname;
  final String studentId;
  final String username;
  final String password;

  Students ({
    required this.name,
    required this.lastname,
    required this.studentId,
    required this.username,
    required this.password,
});
  
  factory Students.fromJson(Map<String, dynamic> json) => Students(
      name: json['name'],
      lastname: json['lastname'],
      studentId: json['student id'],
      username: json['username'],
      password: json['password'],
  );
}