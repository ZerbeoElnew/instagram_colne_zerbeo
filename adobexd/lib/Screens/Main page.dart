
import 'package:adobexd/Screens/Tab4.dart';
import 'package:adobexd/Screens/Tab5.dart';
import 'package:adobexd/Screens/Tabs.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tab2.dart';
import 'Tab3.dart';

class Main_screen extends StatefulWidget {
  Main_screen({Key? key}) : super(key: key);
  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  void alert(){
    showDialog(context: context, builder: (context)
    {
      return CupertinoAlertDialog(
        title: Text("Sign out"),
        content: Text("your are about to log out"),
        actions: [
          MaterialButton(onPressed: () {},
              child:Text("yes") ),
          MaterialButton(onPressed: () {
            Navigator.pop(context);
          },
              child:Text("no") )

        ],
      );
    });
  }
  int selected_index=0;
  void _navigationtap(int index){
    setState(() {
      selected_index=index;
    });
  }
final List<Widget>_pages=[
  first_tab(),
  second_tab(),
  third_tab(),
  // fourth_tab(),
  fifth_tab()
];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 5,
      child: Scaffold(
        body:_pages[selected_index],
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.deepPurpleAccent,
          color: Colors.black,
          onTap: _navigationtap,
          items: [
            Icon(Icons.home,color: Colors.white,),
            Icon(Icons.message,color: Colors.white,),
            Icon(Icons.post_add,color: Colors.white,),
            // Icon(Icons.video_library_sharp,color: Colors.white,),
            Icon(Icons.person,color: Colors.white,)
          ],
        ),
      )
    );
  }
}
