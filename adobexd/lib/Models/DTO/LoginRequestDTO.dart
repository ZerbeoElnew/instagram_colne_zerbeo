// import 'dart:convert';
//
// class LoginRequestDTO {
//   String emailOrUserName;
//   String password;
//
//   LoginRequestDTO({
//     required this.emailOrUserName,
//     required this.password,
//   });
//
//   factory LoginRequestDTO.fromJson(String jsonString) {
//     final Map<String, dynamic> json = jsonDecode(jsonString);
//
//     return LoginRequestDTO(
//       emailOrUserName: json['EmailOrUserName'],
//       password: json['Password'],
//     );
//   }
//
//   String toJson() {
//     final Map<String, dynamic> json = {
//       'EmailOrUserName': emailOrUserName,
//       'Password': password,
//     };
//
//     return jsonEncode(json);
//   }
// }