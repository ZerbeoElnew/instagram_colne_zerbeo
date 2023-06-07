import 'package:flutter/material.dart';

import '../Screens/Tabs.dart';



class Story {
  final AssetImage imageAsset;
  final String title;
  final String details;

  Story({required this.imageAsset, required this.title, required this.details});
}








final AssetImage story1Image = AssetImage('assets/1.jpg');
final AssetImage story2Image = AssetImage('assets/2.jpg');
final AssetImage story3Image = AssetImage('assets/3.jpg');
final AssetImage story4Image = AssetImage('assets/4.jpg');

class StoryWidget extends StatelessWidget {
  final Story story;
  final bool isViewed;

  const StoryWidget({required this.story, required this.isViewed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StoryDetailsScreen(story: story)),
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isViewed ? Colors.grey : Colors.blue,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(.5),
              child: CircleAvatar(
                backgroundImage: story.imageAsset,
                radius: 32,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            story.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class StoryDetailsScreen extends StatelessWidget {
  final Story story;

  const StoryDetailsScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: story.imageAsset,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Back',style: TextStyle(color: Colors.white,fontSize: 30),),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            story.title,
                            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            story.details,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: kBottomNavigationBarHeight,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

