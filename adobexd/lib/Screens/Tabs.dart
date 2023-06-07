import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Drawer.dart';
import '../Login.dart';
import '../Login2.dart';
import '../Models/Stories.dart';
import '../Posts.dart';
import '../Stories.dart';
import 'Tab5.dart';


class Post {
  final String profileimage;
  final String imageSrc;
  final String username;
  final bool isReacted;
  Post(this.profileimage,this.imageSrc,this.username,this.isReacted,);
}



class first_tab extends StatefulWidget {

  const first_tab({Key? key}) : super(key: key);

  @override
  State<first_tab> createState() => _first_tabState();
}
class _first_tabState extends State<first_tab> {

  final List<Story> stories = [
    Story(imageAsset: story1Image,
        title: 'Story 1',
        details: 'This is the first story.'),
    Story(imageAsset: story2Image,
        title: 'Story 2',
        details: 'This is the second story.'),
    Story(imageAsset: story3Image,
        title: 'Story 3',
        details: 'This is the third story.'),
    Story(imageAsset: story4Image,
        title: 'Story 4',
        details: 'This is the fourth story.'),
    Story(imageAsset: story1Image,
        title: 'Story 1',
        details: 'This is the first story.'),
    Story(imageAsset: story2Image,
        title: 'Story 2',
        details: 'This is the second story.'),
    Story(imageAsset: story3Image,
        title: 'Story 3',
        details: 'This is the third story.'),
    Story(imageAsset: story4Image,
        title: 'Story 4',
        details: 'This is the fourth story.'),
  ];





  Widget  build(BuildContext context) {
    void alert(){
     showDialog(
          context: context, builder: (context)
      {
        return AlertDialog(
          backgroundColor: Colors.pink,
          title: Text("Sign out"),
          content: Text("your are about to log out"),
          actions: [
            MaterialButton(onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
                child:Text("yes") ),
            MaterialButton(onPressed: () {
              Navigator.pop(context);
            },
                child:Text("no") )

          ],
        );
      });
    }
    return Senstive_Spam_count<7? MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Text("Instagram"),
            actions: [
              SizedBox(width: 10,),
              IconButton(onPressed:(){},icon:Icon(Icons.search),
              ),
            ],
          ),
        drawer: sidemenu(),
        body: Column(
            children:[
              Container(height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (BuildContext context, int index) {
                  final story = stories[index];
                  return StoryWidget(story: story, isViewed: index % 2 != 0);
                },
              ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostWidget(post: posts[index]);
                    },
                  ),
                ),
              )
            ]),
        )


        ):Center(
      child: Text("Page is blocked",style: TextStyle(fontSize: 30),),
    );

  }
}
