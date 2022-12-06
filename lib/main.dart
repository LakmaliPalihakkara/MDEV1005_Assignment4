import 'package:assignment4/data_service.dart';
import 'package:assignment4/weather_display.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: WeatherDisplay(),
          ),
        ));
  }


}