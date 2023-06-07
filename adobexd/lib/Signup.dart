

import 'dart:io';

import 'package:adobexd/Login2.dart';
import 'package:adobexd/Models/DTO/register_afwra.dart';
import 'package:adobexd/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:select_form_field/select_form_field.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  DateTime _datetime = DateTime.now();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPassController = TextEditingController();
  var dateController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void _showdatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _datetime = value!;
        dateController.text = DateFormat.yMMMEd().format(value);
      });
    });
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      'icon': const Icon(Icons.male),
    },
    {
      'value': 'Female',
      'label': 'Female',
      'icon': const Icon(Icons.female),
      'textStyle': TextStyle(color: Colors.red),
    },
  ];




  File? _selectedImage;
  final _picker = ImagePicker();
  late String fileName;

  Future<void> _pickImages() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path.toString());
        fileName = _selectedImage!.path.split('/').last;
      });
    }


  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("SignUp"),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  height: 800,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/insta2.jpg'),
                      fit: BoxFit.fill,
                      scale: 4,
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls Enter name';
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'UserName',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2), // Change the color here
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls Enter Email';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2), // Change the color here
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls Enter Phone';
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Phone',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2), // Change the color here
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls Enter Password';
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Create password',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2), // Change the color here
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls Enter Password';
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: confirmPassController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Confirm password',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2), // Change the color here
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          SelectFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),

                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2), // Change the color here
                              ),
                            ),
                            type:
                                SelectFormFieldType.dropdown, // or can be dialog
                            initialValue: 'circle',
                            icon: Icon(Icons.search),

                            labelText: 'Gender',
                            items: _items,
                            onChanged: (val) => print(val),
                            onSaved: (val) => print(val),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white)),
                                    labelText: 'Date',
                                    labelStyle:
                                    TextStyle(color: Colors.white, fontSize: 20),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2), // Change the color here
                                    ),
                                  ),
                                  enabled: false,
                                  controller: dateController,
                                ),
                              ),
                              SizedBox(width: 15,),
                              MaterialButton(
                                onPressed: _showdatepicker,
                                color: Colors.blue,
                                child: Text(
                                  "Choose Date",
                                  style: (TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          // MaterialButton(onPressed:(){
                          //   print(_datetime);
                          // }),
                          MaterialButton(
                            height: 100,
                            color: Colors.blue,
                            onPressed: (_pickImages),
                            child: Icon(Icons.image,color: Colors.white,size: 60),
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Colors.white,
                                width: 6.0,
                              ),
                            ),
                          ),


                          MaterialButton(
                            minWidth: 300,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blue,
                            child: Text('Sign Up',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                userRegister();
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              TextButton(
                                child: Text('Sign in',
                                    style: TextStyle(
                                        color: Colors.greenAccent, fontSize: 22)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                              "You have enterned wrong Email or password"),
                                          actions: [
                                            MaterialButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK"),
                                            )
                                          ],
                                        );
                                      });
                                },
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }


  void userRegister()async{
    final dio = Dio();
    final response = await dio.post(
      'https://instagramspamdetectionwebapi.azurewebsites.net/api/User/register',
      data: {
         'Email' :'ahmed1@gmail.com' ,
         'Password':'afwara1' ,
         'UserName':'afwara1' ,
         'Name':'ahmed' ,
         'Gender':'male' ,
         'Birthdate':'2023-5-4',
         'ProfilePicture':  MultipartFile.fromBytes(File(_selectedImage!.path).readAsBytesSync(),filename: fileName)
   
      }
    );

    if(response.statusCode == 200){
      registerResult = RegisterAuthModel.fromJson(response.data);
    }else{
      debugPrint('Error ${response.statusMessage}');
    }
  }
}
