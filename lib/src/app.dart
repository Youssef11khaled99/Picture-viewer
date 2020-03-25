import "package:flutter/material.dart";
import "package:http/http.dart" show get;
import './models/image_model.dart';
import './widgets/image_list.dart';
import 'dart:convert';


class App extends StatefulWidget {

  createState() {
    return AppState();
  }
}


class AppState extends State<App>{
  
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    final response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = new ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Text(
            "+",
            //style: TextStyle(fontFamily: 'RobotoMono'),
            style: new TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 30.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: fetchImage,
          splashColor: Colors.deepPurpleAccent,
          backgroundColor: Color(0xFF42A5F5),
        ),
        appBar: AppBar(
          title: Text("Let's see some images"),
        ),
      ),
    );
  }
}