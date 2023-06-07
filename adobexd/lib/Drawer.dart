import 'package:adobexd/Login2.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class sidemenu extends StatelessWidget {
  const sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void alert() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.pink,
              title: Text("Sign out"),
              content: Text("your are about to log out"),
              actions: [
                MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("yes")),
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("no"))
              ],
            );
          });
    }

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 120,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/t.jpg'),
                          radius: 115,
                        )), //child: Text("Ahmed",style: TextStyle(fontSize: 20),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ahmed Sameh',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit image',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text("logout"),
              onTap: alert,
            )
          ],
        ),
      ),
    );
  }
}
