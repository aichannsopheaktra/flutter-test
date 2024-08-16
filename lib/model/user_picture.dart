class UserPicture{
  String large;
  String medium;
  String thumnail;
  UserPicture({
    required this.large,
    required this.medium,
    required this.thumnail,
  });
  factory UserPicture.fromMap(Map<String, dynamic> json){
      return UserPicture(
        large: json['large'] ?? '',
        medium: json['medium'] ?? '',
        thumnail: json['thumnail'] ?? '',
      );
  }
}