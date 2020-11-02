import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    title: 'World Time',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: "/",
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      "/": (context) => Loading(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      "/home": (context) => Home(),
      "/location":(context) => ChooseLocation(),
    },
  ));
}

