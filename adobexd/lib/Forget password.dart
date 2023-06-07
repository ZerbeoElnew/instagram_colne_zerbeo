import 'package:adobexd/Login2.dart';
import 'package:flutter/material.dart';
import 'DATA BASE.dart';
import 'Screens/Main page.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}
String _email = '';
String _password = '';
bool _rememberMe = false;
class _forgetpasswordState extends State<forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Retrieve Password"),
          ),
          body:SingleChildScrollView(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/insta2.jpg'),
                      fit: BoxFit.fill,scale: 4,
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50,),
                     Image.asset('assets/LOGO 5.jpg',scale: 2,),
                      SizedBox(height: 20,),
                      Text("Enter Used Email",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 40,),
                      TextField(
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Email',labelStyle: TextStyle(color: Colors.white,fontSize: 20),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2), // Change the color here
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        },
                      ),
                      SizedBox(height: 30.0),
                      MaterialButton(
                        minWidth: 300,
                        height: 50,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Text('Retrieve',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                        onPressed: () {
                          if(Login_data.containsKey(_email) ){
                            print("ok");
                            if(Login_data[_email][1]==_password){
                              print("ok password");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Main_screen()),
                              );
                            };
                            if(Login_data[_email][1]!=_password){
                              print("Wrong password");
                            };
                          };
                          if(!Login_data.containsKey(_email) ){
                            print("wrong email");
                          };
                        },
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Rememberd it ?",style: TextStyle(color: Colors.white,fontSize: 20)),
                          TextButton(
                            child: Text('Sign in',style: TextStyle(color: Colors.greenAccent,fontSize: 22)),
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
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
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}




