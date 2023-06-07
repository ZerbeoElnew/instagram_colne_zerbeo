
import 'package:adobexd/Screens/Tab4.dart';
import 'package:adobexd/Screens/Tab5.dart';
import 'package:adobexd/Screens/Tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/Tab2.dart';
import 'Screens/Tab3.dart';

class logout_alert extends StatefulWidget {logout_alert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _Main_screenState extends State<logout_alert> {
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
    fourth_tab(),
    fifth_tab()
  ];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 5,
        child: Scaffold(
          body:_pages[selected_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:selected_index,
            onTap: _navigationtap,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.message),label: "Messages"),
              BottomNavigationBarItem(icon: Icon(Icons.post_add),label: "Newpost"),
              BottomNavigationBarItem(icon: Icon(Icons.video_library_sharp),label: "Reels"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
            ],
          ),
        )
    );
  }
}
