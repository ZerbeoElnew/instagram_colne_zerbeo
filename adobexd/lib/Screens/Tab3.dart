import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Drawer.dart';
import 'Tab5.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http/http.dart' as http;



class third_tab extends StatefulWidget {
   third_tab({Key? key}) : super(key: key);

  @override
  State<third_tab> createState() => _third_tabState();
}







class _third_tabState extends State<third_tab> {

  List<Asset> _images = [];

  Future<void> _pickImages() async {
    List<Asset> resultList = [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: _images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "My App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    setState(() {
      _images = resultList;
    });
  }



  Future getPostResult() async {
    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://instagramspamdetectionwebapi.azurewebsites.net/api/Post/upload'),
    );

    print(_images);
    // Add each asset to the request
    for (Asset asset in _images) {
      ByteData byteData = await asset.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      print(asset.name);
      String? contentType = lookupMimeType(asset.name!);

      http.MultipartFile file = http.MultipartFile.fromBytes(
        'files',
        imageData,
        filename: asset.name,
        contentType: MediaType.parse(contentType!),

      );
      print(file.contentType);
      print(file.filename);

      request.files.add(file);
    }
    request.fields['uid'] = "29cc410e-039e-43cb-8145-f89830456cd3";
    request.fields['caption'] = "hello my brother how are you doing";
    // Send the request
    var response = await request.send();

    // Print the response status code
    print(response.statusCode);

    // Print the response body
    await response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }








  @override
  Widget  build(BuildContext context) {

    return Senstive_Spam_count<5? MaterialApp(
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
          resizeToAvoidBottomInset: true,
          body:SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              reverse: true,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      CircleAvatar(backgroundImage: AssetImage('assets/t.jpg',),radius: 50,
                        child:CircularPercentIndicator(radius: 50,lineWidth:  4  ,percent:perc ,progressColor: color, animation: true,backgroundColor: Colors.white,),
                      ),
                      SizedBox(width: 10,),
                      Text("Ahmed Sameh",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                      SizedBox(width: 30,),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: (){
                          getPostResult();
                        },
                        child: Text('Post',style: TextStyle(color: Colors.white,fontSize: 30),),
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.all(20),
                  child: Container(
                    color: Colors.white12,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                    maxLines: null,
                                    minLines: 3,
                                    decoration: InputDecoration(
                                        hintText: 'Whats on your mind ?',hintStyle:TextStyle(color: Colors.white,fontSize: 20),
                                        border: InputBorder.none
                                    ),
                                    textInputAction: TextInputAction.newline,
                                    keyboardType: TextInputType.multiline,
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),),
                  SizedBox(height:70 ,),

                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_images.isNotEmpty)
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _images.map((image) {
                                return AssetThumb(
                                  asset: image,
                                  width: 300,
                                  height: 300,
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                              height: 100,
                              color: Colors.blue,
                              onPressed: (_pickImages),
                              child: Icon(Icons.image,color: Colors.white,size: 60),
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 6.0,
                                ),
                              ),
                          ),
                          MaterialButton(onPressed: () {
                            showDialog(context: context, builder:(BuildContext context){
                              return AlertDialog(
                                title: Text("Sucess!"),
                                content: Container(
                                  height: 500,
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Your post has been added succesfully',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset('assets/Taymoor.png')
                                          ),
                                        ), // Spam Details
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
                            } );
                          },
                            color: Colors.red,
                            child: Text(''),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            )
          ):
    Center(
      child: Text("Page is blocked",style: TextStyle(fontSize: 30),),
    );
  }

}




class MyWidget extends StatelessWidget {
  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Use the picked file to display the image
      // For example:
      // Image.file(File(pickedFile.path))
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _getImageFromGallery,
      child: Text('Pick image from gallery'),
    );
  }
}