// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class RegisterationRequest {
//   String? email;
//   String? password;
//   String? userName;
//   String? name;
//   String? gender;
//   DateTime birthdate;
//   String? role;
//
//   RegisterationRequest({
//     this.email,
//     this.password,
//     this.userName,
//     this.name,
//     this.gender,
//     required this.birthdate,
//     this.role,
//   });
//
//   factory RegisterationRequest.fromJson(String jsonString) {
//     final Map<String, dynamic> json = jsonDecode(jsonString);
//
//     return RegisterationRequest(
//       email: json['Email'],
//       password: json['Password'],
//       userName: json['UserName'],
//       name: json['Name'],
//       gender: json['Gender'],
//       birthdate: DateTime.parse(json['Birthdate']),
//       role: json['Role'],
//     );
//   }
//
//   String toJson() {
//     final Map<String, dynamic> json = {
//       'Email': email,
//       'Password': password,
//       'UserName': userName,
//       'Name': name,
//       'Gender': gender,
//       'Birthdate': birthdate.toIso8601String(),
//       'Role': role,
//     };
//     return jsonEncode(json);
//   }
//
//
//   void makeRequest() async {
//     var url = Uri.parse('https://example.com/api/data');
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       // Request was successful
//       print('Request successful');
//       print(response.body);
//     } else if (response.statusCode == 401) {
//       // Unauthorized access
//       print('Unauthorized access');
//     } else {
//       // Other error occurred
//       print('Error occurred');
//     }
//   }
//
// }