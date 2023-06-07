import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Screens/Tab5.dart';
import 'Spam window.dart';
  alert_Spam() async {
  var context;
  showDialog(
      context: context,
      builder: (context) {
        var x;
        if(Senstive_Spam_count==1){
          x=spam6();
          spam_counter=5000;
          perc=1;
        };
        if(Senstive_Spam_count==2){
          x=spam2();
          spam_counter=4700;
          color=Colors.yellow;
          perc=0.85;
        };
        if(Senstive_Spam_count==3){
          x=spam3();
          spam_counter=4200;
          color=Colors.amber;
          perc=0.7;
        };
        if(Senstive_Spam_count==4){
          x=spam4();
          spam_counter=3500;
          color=Colors.orange;
          perc=0.55;
        };
        if(Senstive_Spam_count==5){
          x=spam5();
          spam_counter=2600;
          color=Colors.deepOrange;
          perc=0.4;
        };
        if(Senstive_Spam_count==6){
          x=spam6();
          spam_counter=1400;
          color=Colors.red;
          perc=0.25;
        };
        if(Senstive_Spam_count==7){
          x=spam5();
          spam_counter=0;
          Senstive_Spam_count=0;
          color=Colors.grey;
          perc=0;
        };
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
                  x,
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