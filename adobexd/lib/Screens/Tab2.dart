import 'package:flutter/material.dart';

import '../Drawer.dart';
import 'Tab5.dart';
class Friend {
  final String name;
  final String message;
  final String time;
  final String imageUrl;

  Friend({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
  });
}
class second_tab extends StatefulWidget {
  const second_tab({Key? key}) : super(key: key);

  @override
  State<second_tab> createState() => _second_tabState();
}

class _second_tabState extends State<second_tab> {
  List<Friend> _friends = [
    Friend(
      name: 'John',
      message: 'Hey, how are you?',
      time: '2:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Jane',
      message: 'What are you up to today?',
      time: '1:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Bob',
      message: 'Do you want to grab lunch?',
      time: '12:45 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Alice',
      message: 'I saw your new post. It looks great!',
      time: '10:20 AM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'John',
      message: 'Hey, how are you?',
      time: '2:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Jane',
      message: 'What are you up to today?',
      time: '1:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Bob',
      message: 'Do you want to grab lunch?',
      time: '12:45 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Alice',
      message: 'I saw your new post. It looks great!',
      time: '10:20 AM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'John',
      message: 'Hey, how are you?',
      time: '2:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Jane',
      message: 'What are you up to today?',
      time: '1:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Bob',
      message: 'Do you want to grab lunch?',
      time: '12:45 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Alice',
      message: 'I saw your new post. It looks great!',
      time: '10:20 AM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'John',
      message: 'Hey, how are you?',
      time: '2:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Jane',
      message: 'What are you up to today?',
      time: '1:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Bob',
      message: 'Do you want to grab lunch?',
      time: '12:45 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Alice',
      message: 'I saw your new post. It looks great!',
      time: '10:20 AM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'John',
      message: 'Hey, how are you?',
      time: '2:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Jane',
      message: 'What are you up to today?',
      time: '1:30 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Bob',
      message: 'Do you want to grab lunch?',
      time: '12:45 PM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Friend(
      name: 'Alice',
      message: 'I saw your new post. It looks great!',
      time: '10:20 AM',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Friends Messages'),
      ),
      drawer: sidemenu(),
      body: ListView.builder(
        itemCount: _friends.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Column(
                children: [
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(_friends[index].imageUrl),
                      ),
                      title: Text(_friends[index].name,style: TextStyle(color: Colors.white),),
                      subtitle: Text(_friends[index].message,style: TextStyle(color: Colors.white)),
                      trailing: Text(_friends[index].time,style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => InstagramMessageScreen(
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height:10)
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
class InstagramMessageScreen extends StatefulWidget {
  @override
  _InstagramMessageScreenState createState() => _InstagramMessageScreenState();
}

class _InstagramMessageScreenState extends State<InstagramMessageScreen> {
  List<String> _messages = [
    'Hey, how are you?',
    'I am doing great, thanks for asking!',
    'What are you up to today?',
    'Just hanging out at home. How about you?',
    'I am working on a new project at work. It\'s really exciting!',
    'That sounds interesting. What kind of project is it?',
    'It\'s a mobile app that helps people track their fitness goals.',
    'That\'s cool. I could definitely use something like that.',
    'Yeah, it should be ready for beta testing in a few weeks.',
  ];

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget  build(BuildContext context) {
    return Senstive_Spam_count<6?Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Instagram Message'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.blue : Colors.white54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _messages[index],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      setState(() {
                        _messages.insert(0, _textEditingController.text);
                        _textEditingController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ):Center(
      child: Text("Page is blocked",style: TextStyle(fontSize: 30),),
    );
  }
}
