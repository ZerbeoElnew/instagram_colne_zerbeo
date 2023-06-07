import 'package:adobexd/Spams/Spam%20window.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Screens/Tab5.dart';
class Adult_Sensetive extends StatefulWidget {
  const Adult_Sensetive({Key? key}) : super(key: key);

  @override
  State<Adult_Sensetive> createState() => _Adult_SensetiveState();
}

class _Adult_SensetiveState extends State<Adult_Sensetive> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog (
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
  }
}
