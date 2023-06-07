import 'package:adobexd/Signup.dart';
import 'package:flutter/material.dart';

import 'Screens/Main page.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailinput = TextEditingController();  // بيستقبل ال input من ال user
  final passwordinput = TextEditingController();
  String email = ' ';   // بياخد القيمه من ال input وبيساويها بال variable عشان تطبع
  String password = '';

  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage('assets/insta.jpg'),
                  fit:BoxFit.cover,
                )
              ),
            ),
            Container(
              height: 300,width: 300,
              color: Colors.white70,
              alignment: Alignment.center,
              child:Image(image:AssetImage('assets/Taymoor.png'),height: 300,width: 300,)
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailinput,
              decoration:  InputDecoration(hintText: 'Enter Email',
                  border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: (){
                  emailinput.clear();
                },
                icon: Icon(Icons.add),)
              ),
            ),    // ________________________Enter Email___________________________
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordinput,
              decoration:  InputDecoration(hintText: 'Enter Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    passwordinput.clear();
                  },
                    icon: Icon(Icons.add),)
              ),
            ),   //________________________ Enter Password________________________
            SizedBox(
              height: 40,
            ),
            Container(
              width: 250,
              alignment: Alignment.center,
              height: 50, color: Colors.blueAccent,
                /*decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                )*/
                child: MaterialButton(onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>Main_screen()));
                  setState(() {
                    email = emailinput.text;
                  });
                },
                  child: Text("Login",style: TextStyle(color: Colors.black),),
                  minWidth: 2000,
                  height: 2000,
                )
            ),//___________________________ Login__________________________________
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextButton(
                child:Text('Forgot Password ?',style: TextStyle(fontSize: 15)),
                onPressed: () {
                  // Navigate to second route when tapped.
                },
              ),
            ),  //________________________ Forgot password___________________________
            SizedBox(
              height: 1,
            ),
            Container(
              child: TextButton(
                child:Text('Sign Up',style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpScreen()));
                  // Navigate to second route when tapped.
                },
              ),
            ), // ________________________Signup _____________________________________
          ],
        ),
      )
    );
  }
}