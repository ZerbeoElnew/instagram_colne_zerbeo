import 'dart:io';

import 'package:adobexd/Spams/Senstive%20Spam.dart';
import 'package:adobexd/Spams/Spam%20window.dart';
import 'package:adobexd/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Drawer.dart';
import '../Login.dart';
Map data_base_c={};
var count=0;
var age=14;
var name="Ahmed";
var Senstive_Spam_count=0;
var block=0;
var color=Colors.green;
var spam_counter=5000;
var ID="ID_2465";
double perc=1;

class fifth_tab extends StatefulWidget {
  const fifth_tab({Key? key}) : super(key: key);

  @override
  State<fifth_tab> createState() => _fifth_tabState();
}

class _fifth_tabState extends State<fifth_tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Instagram",style: TextStyle(color: Colors.white),),
        actions: [
          const SizedBox(width: 10,),
          IconButton(onPressed:(){},icon:Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10,),
              Column(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage('${loginResult.result!.user!.profilePictureURL}',),radius: 50,
                    child:CircularPercentIndicator(radius: 50,lineWidth:  4  ,percent:perc ,progressColor: color, animation: true,backgroundColor: Colors.white,),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '${loginResult.result!.user!.name}',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '120',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        'Posts',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Text(
                        '230',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Text(
                        '180',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),

          SizedBox(height: 5,),
          SizedBox(height: 5,),
          Row(
            children: [
              SizedBox(width: 35,),
              Text("$spam_counter",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            children: [
              MaterialButton(onPressed: () {
                setState(() {
                  if(Senstive_Spam_count==0||Senstive_Spam_count>6){
                    color = Colors.green;
                  }
                  color;
                  Senstive_Spam_count++;
                  alert_Spam();
                });
              },
              color: Colors.red,
                child: Text(''),
              ),
              SizedBox(width: 50,),
              // ,Text("$spam_counter",style: TextStyle(color: Colors.white,fontSize: 40),),
              SizedBox(width: 50,),
              // MaterialButton(onPressed: () {
              //   setState(() {
              //     if(Senstive_Spam_count==0||Senstive_Spam_count>6){
              //     }
              //     print(data_base_c);
              //   });
              // },
              //   color: Colors.yellow,
              //   child: Text(''),
              // ),
            ],
          ),
          SizedBox(height: 8),
          // Text(
          //   'Gmail Account .com',
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: Colors.white
          //   ),
          // ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(12,
                    (index) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Image.asset(
                    'assets/$index.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void alert_Spam() {
    showDialog(
        context: context,
        builder: (context) {
          var x;
          if(Senstive_Spam_count==1){
            x=spam1();
            spam_counter=5000;
            perc=1;
            count =0;
            block=1;
          };
          if(Senstive_Spam_count==2){
            x=spam2();
            spam_counter=4700;
            color=Colors.yellow;
            perc=0.85;
            count =1;
            block=2;
          };
          if(Senstive_Spam_count==3){
            x=spam3();
            spam_counter=4200;
            color=Colors.amber;
            perc=0.7;
            count =2;
            block=3;
          };
          if(Senstive_Spam_count==4){
            x=spam4();
            spam_counter=3500;
            color=Colors.orange;
            perc=0.55;
            count =3;
            block=4;
          };
          if(Senstive_Spam_count==5){
            x=spam5();
            spam_counter=2600;
            color=Colors.deepOrange;
            perc=0.4;
            count =4;
            block=5;
          };
          if(Senstive_Spam_count==6){
            x=spam6();
            spam_counter=1400;
            color=Colors.red;
            perc=0.25;
            count =5;
            block=6;
          };
          if(Senstive_Spam_count==7){
            x=spam7();
            spam_counter=0;
            color=Colors.grey;
            perc=0;
            count =6;
            block=7;
            Senstive_Spam_count=0;
            block=7;
          };
          print(spam_counter);
          if(data_base_c.containsKey(ID)==true){
            print("already added");
            data_base_c[ID][2]=spam_counter;
            data_base_c[ID][3]=count;
          }
          else{
            print("New account been added");
            data_base_c.addAll({ID:[name,age,spam_counter,count]});
          }
          print(data_base_c);
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Spam Detected !! ",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/Taymoor.png')
                      ),
                    ),
                    x,                                                   // Spam Details
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          // fixedSize: Size(250, 50),
                        ),
                        child: Text(
                          "Verify",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}

