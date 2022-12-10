import 'package:assignment4/data_service.dart';
import 'package:assignment4/weather_display.dart';
import 'package:flutter/material.dart';

import 'models.dart';
import 'package:assignment4/Cal/calculator.dart';
import 'package:assignment4/greeting.dart';

class TabDispay  extends StatelessWidget {

  static const String _title = 'Cal and Weather App';

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tools Buddy'),
        bottom: TabBar(
          tabs: const <Widget>[
            Tab(
              text: 'Greetings',
                )
            ,
            Tab(
              text: 'Weather',
            ),
            Tab(
              text: 'Calculator',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:[
          Center(
            child: Greetings(),
          ),
          Center(
              child: WeatherDisplay(),
          ),
          Center(
              child: Calculator()
          ),
        ],
      ),
    );
  }
}