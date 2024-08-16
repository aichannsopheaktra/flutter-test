class UserDob{
  DateTime date;
  int age;
  UserDob({
    required this.date,
    required this.age
  });
  factory UserDob.fromMap(Map<String, dynamic> json){
      return UserDob(
      date: DateTime.parse(json['date']),
      age: json['age']
    );
  }
}