import 'dart:io';

import 'package:flutter/cupertino.dart';
Map list={};
var Type;
var x;
var spam=0;
void Media_spam(var x ){
  var d1;
  if(list.containsKey(x)==true){
    print("already Exists");
  }
  else{
    print("added");
    list.addAll({x:0});
  }
  d1='y';
  while(d1=='y'){
    list[x]=list[x]+1;
    if(list[x]<2){
      spam++;
      print("first ban method");
      print("Your post has been deleted because it Violates our community standards + Remove media (image or video) and send warn message ");
      print("add another count ? y,n");
      d1=stdin.readLineSync();
    }
    if(list[x]>=2&&list[x]<3){
      spam ++;
      print("second ban method");
      print("our post has been deleted because it Violates our community standards + Remove media (image or video), send warn message and ban user from uploading media for 2 days.");
      print("add another count ? y,n");
      d1=stdin.readLineSync();
    }
    if(list[x]>=3&&list[x]<4){
      spam ++;
      print("third ban method");
      print("Your post (image or video) was removed because it may have copyrighted content that belongs to someone else. + Remove post, send message and ban the user from uploading media for 5 days.	 ");
      print("add another count ? y,n");
      d1=stdin.readLineSync();
    }
    if(list[x]>=4&&list[x]<5){
      spam ++;
      print("fourth ban method");
      print("Your post (image or video) was removed because it may have copyrighted content that belongs to someone else. + Remove post, send warn message and ban the user from uploading media for  10 days.	 ");
      print("add another count ? y,n");
      d1=stdin.readLineSync();
    }
    if(list[x]>=5){
      spam ++;
      print("last ban method");
      print("Your post (image or video) was removed because it may have copyrighted content that belongs to someone else. + Remove post, send warn message and permanent ban.	 ");
      list[x]=5;
      d1='n';
    }
  }
  print(x +"   ${list[x]}");
}

class spam1 extends StatefulWidget {
  const spam1({Key? key}) : super(key: key);

  @override
  State<spam1> createState() => _spam1State();
}

class _spam1State extends State<spam1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "              Account Added to Spam Data Base",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class spam2 extends StatelessWidget {
  const spam2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Your post (image or video) was removed because it may have copyrighted"
            " content that belongs to someone else and you lost 300 points",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class spam3 extends StatelessWidget {
  const spam3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Your post (image or video) was removed because it may have copyrighted "
            "content that belongs to someone else and you lost 500 points.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class spam4 extends StatelessWidget {
  const spam4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Your post (image or video) was removed because it may have copyrighted "
            "content that belongs to someone else and you lost 700 points.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class spam5 extends StatelessWidget {
  const spam5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Your post (image or video) was removed because it may have copyrighted "
            "content that belongs to someone else and you lost 900 points.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class spam6 extends StatelessWidget {
  const spam6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Your post (image or video) was removed because it may have copyrighted "
            "content that belongs to someone else and you lost 1200 points.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class spam7 extends StatelessWidget {
  const spam7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Your post (image or video) was removed because it may have copyrighted "
            "content that belongs to someone else and you lost 1400 points.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}


