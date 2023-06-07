class User {
  late final String uid;
  late final String email;
  late final String userName;
  late final String name;
  late final String gender;
  late final DateTime birthdate;
  late final bool isBanned;
  late final bool isPermaBanned;
  late final DateTime? bannedUntil;
  late final int spamPoints;
  late final String profilePictureURL;

  User({
    required this.uid,
    required this.email,
    required this.userName,
    required this.name,
    required this.gender,
    required this.birthdate,
    required this.isBanned,
    required this.isPermaBanned,
    required this.bannedUntil,
    required this.spamPoints,
    required this.profilePictureURL,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      userName: json['userName'],
      name: json['name'],
      gender: json['gender'],
      birthdate: DateTime.parse(json['birthdate']),
      isBanned: json['isBanned'],
      isPermaBanned: json['isPermaBanned'],
      bannedUntil: json['bannedUntil'] == null ? null : DateTime.parse(json['bannedUntil']),
      spamPoints: json['spamPoints'],
      profilePictureURL: json['profilePictureURL'],
    );
  }
}