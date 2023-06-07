import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Drawer.dart';
import '../Login.dart';
import 'package:http/http.dart' as http;


class Post {
  final String username;
  final String avatar;
  final String image;
  final String description;
  final List<String> comments;
  bool isReacted;
  int reactions;

  Post({required this.username, required this.avatar, required this.image, required this.description, required this.comments, this.isReacted = false, this.reactions = 0,});

  void toggleReact() {
    if (isReacted) {
      reactions--;
    } else {
      reactions++;
    }
    isReacted = !isReacted;
  }
}







class _Post {
  late final String pid;
  late final String uid;

  _Post(this.pid, this.uid);
/*late final String Caption;
  late final DateTime date;
  late final bool Is_verfied;
  late final bool Is_Spam;
  late final Int no_OF_comments;
  late final Int no_OF_reacts;
  late final DateTime created_At;
  late final DateTime edited_At;*/


}










class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();

  Future<void> fetchPosts() async {
    final url = Uri.parse("https://instagramspamdetectionwebapi.azurewebsites.net/api/Post");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);
      _Post(
        data['pid'],
        data['']
      );
    } else {
      throw Exception('Failed to load posts');
    }

  }


}

class _PostWidgetState extends State<PostWidget> {
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container
            (
            decoration: BoxDecoration(color: Colors.white10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.post.avatar),
                    ),
                    SizedBox(width: 8.0),
                    Text(widget.post.username,style: (TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(
                      widget.post.description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Image.asset(widget.post.image),
                SizedBox(height: 8.0),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.post.avatar),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          border:InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            widget.post.comments.add(value);
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(
                        widget.post.isReacted ? Icons.favorite : Icons.favorite_border,
                        color: widget.post.isReacted ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.post.toggleReact();
                        });
                      },
                    ),
                    Text(widget.post.reactions.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(width: 8.0),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.post.comments
                        .map(
                          (comment) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundImage: AssetImage(widget.post.avatar),
                            radius: 12.0,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(comment,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 50,)
                        ],
                      ),
                    )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }


}

final posts = [
  Post(
    username: 'Ahmed Sameh',
    avatar: 'assets/t.jpg',
    image: 'assets/t.jpg',
    description: 'Smile for tomorrow ! 😂😂',
    comments: ['3azamaaaaaaaaaaaa 😍😍'],
    reactions: 10,),
  Post(
    username: 'Ahmed Sabry',
    avatar: 'assets/1.jpg',
    image: 'assets/2.jpg',
    description: 'so Ez',
    comments: ['Nice skin !!'],
    reactions: 10,)

];



