import 'dart:convert';
import 'dart:math';

import 'package:adobexd/Models/DTO/Login_Afwara.dart';
import 'package:adobexd/Screens/Main%20page.dart';
import 'package:adobexd/Screens/Tab5.dart';
import 'package:adobexd/Signup.dart';
import 'package:adobexd/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Forget password.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  bool _rememberMe = false;

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 1000,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/insta2.jpg'),
                        fit: BoxFit.fill,scale: 4,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 50,),
                        Image.asset('assets/LOGO 5.jpg',scale: 2,width: 700,),
                        TextFormField(
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator:  (value){
                            if(value!.isEmpty){
                              return 'Enter Email';
                            }else{
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',labelStyle: TextStyle(color: Colors.white,fontSize: 20),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 2), // Change the color here
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            labelText: 'Password',hoverColor: Colors.white,labelStyle: TextStyle(color: Colors.white,fontSize: 20),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 2), // Change the color here
                            ),

                          ),
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Pls Enter Password';
                            }else{
                              return null;
                            }
                          },
                          onChanged: (value) {

                            setState(() {
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.black, // Set the check color here
                                ),
                                const Text('Remember me', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            TextButton(
                              child: const Text('Forgot password?',style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => forgetpassword()));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        MaterialButton(
                          minWidth: 300,
                          height: 50,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.blue,
                          child: const Text('Log in',style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              var emailText = emailController.text;
                              var passText = passController.text;
                              userLogin(context,'zerbeo', 'a01030395062');
                              showErrorBox(context, errorMsg);
                            }
                          },
                        ),
                        const SizedBox(height: 40.0),
                        const Text("Don\'t have an account?",style: TextStyle(color: Colors.white,fontSize: 20)),
                        const SizedBox(height: 15,),
                        TextButton(
                          child: const Text('Sign up',style: TextStyle(color: Colors.greenAccent,fontSize: 22)),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()));
                          },
                        ),
                        MaterialButton(onPressed: (){
                          showDialog(context: context, builder:(BuildContext context){
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("You have enterned wrong Email or password, pls try again"),
                              actions: [
                                MaterialButton(onPressed: (){
                                  Navigator.of(context).pop();
                                },child: Text("OK"),)
                              ],
                            );
                          } );
                        },color: Colors.white,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }


  String errorMsg = '';
  bool errorLogin = false;
  void userLogin(BuildContext context,String email,String password){
    final dio = Dio();
    dio.post(
      'https://instagramspamdetectionwebapi.azurewebsites.net/api/User/login',
      data: {
        'emailOrUserName':email,
        'password':password,
      },

    ).then((value){
      if(value.statusCode == 200){
        debugPrint(value.data.toString());
        loginResult = LoginAuthModel.fromJson(value.data);
        debugPrint('returned ${loginResult.result!.user!.email}');
        navigateToAndDelete(context, Main_screen());
      }
    }).catchError((error){
      debugPrint('$error');
      debugPrint('Erro ya 7bb');
      showErrorBox(context, 'Email or Password Incorrect');




    });

  }


  Widget showErrorBox(BuildContext context,String msg){

    return AlertDialog(
      title: const Text("Error"),
      content: Text(msg),
      actions: [
        MaterialButton(onPressed: (){
          Navigator.of(context).pop();
        },child: const Text("OK"),)
      ],
    );


  }


}
