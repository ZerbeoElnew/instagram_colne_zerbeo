class LoginAuthModel {
  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  Result? result;

  LoginAuthModel(
      {this.statusCode, this.isSuccess, this.errorMessages, this.result});

  LoginAuthModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = json['errorMessages'].cast<String>();
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isSuccess'] = this.isSuccess;
    data['errorMessages'] = this.errorMessages;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  User? user;
  String? role;
  String? token;

  Result({this.user, this.role, this.token});

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? uid;
  String? email;
  String? userName;
  String? name;
  String? gender;
  String? birthdate;
  bool? isBanned;
  bool? isPermaBanned;
  Null? bannedUntil;
  int? spamPoints;
  String? profilePictureURL;

  User(
      {this.uid,
        this.email,
        this.userName,
        this.name,
        this.gender,
        this.birthdate,
        this.isBanned,
        this.isPermaBanned,
        this.bannedUntil,
        this.spamPoints,
        this.profilePictureURL});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    userName = json['userName'];
    name = json['name'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    isBanned = json['isBanned'];
    isPermaBanned = json['isPermaBanned'];
    bannedUntil = json['bannedUntil'];
    spamPoints = json['spamPoints'];
    profilePictureURL = json['profilePictureURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['isBanned'] = this.isBanned;
    data['isPermaBanned'] = this.isPermaBanned;
    data['bannedUntil'] = this.bannedUntil;
    data['spamPoints'] = this.spamPoints;
    data['profilePictureURL'] = this.profilePictureURL;
    return data;
  }
}
