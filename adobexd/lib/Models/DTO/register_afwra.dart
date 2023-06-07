class RegisterAuthModel {
  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  Result? result;

  RegisterAuthModel(
      {this.statusCode, this.isSuccess, this.errorMessages, this.result});

  RegisterAuthModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? email;
  String? userName;
  String? profilePictureURL;

  Result(
      {this.id, this.name, this.email, this.userName, this.profilePictureURL});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userName = json['userName'];
    profilePictureURL = json['profilePictureURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['profilePictureURL'] = this.profilePictureURL;
    return data;
  }
}
