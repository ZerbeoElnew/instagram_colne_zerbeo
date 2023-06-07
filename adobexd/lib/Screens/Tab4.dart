import 'package:flutter/material.dart';

import '../Drawer.dart';
import '../Login.dart';
import 'Tab5.dart';
class fourth_tab extends StatelessWidget {
  const fourth_tab({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {
    return Senstive_Spam_count<5? MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Instagram"),
            actions: [
              SizedBox(width: 10,),
              IconButton(onPressed:(){},icon:Icon(Icons.search),
              ),
            ],
          ),
            drawer: sidemenu(),
          body:Column(
        children:[
        Expanded(
          child: Container(
            child:ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 400,
                    color: Colors.blueAccent,
                  ),
                ),

              ],
            ),),
        )
        ])
        )
    ):Center(
      child: Text("Page is blocked",style: TextStyle(fontSize: 30),),
    );
  }
}
