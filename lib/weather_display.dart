import 'package:assignment4/data_service.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class WeatherDisplay extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _WeatherDisplay();
}
class _WeatherDisplay extends State<WeatherDisplay> {

final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Text('Weather API',
                    style: TextStyle(fontSize: 30,color: Colors.blue),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child:
                Text('Please search with city name below to get the temperature details:',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center)
            )

          ],
        ),
        if (_response != null)
          Column(
            children: [
              Image.network(_response!.iconUrl),
              Text(
                '${_response!.tempInfo.temperature}° F',
                style: TextStyle(fontSize: 30),
              ),
              Text(_response!.weatherInfo.description,
                style: TextStyle(fontSize: 13)),

              Text(
                'Feels like ${_response!.tempInfo.feelsLikeTemp}° F',
    style: TextStyle(fontSize: 13)
              )

            ],
          ),

        if(_response == null)
          Column(
            children: [
              Text('--',
                style: TextStyle(fontSize: 40),)
            ],
          ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: 150,
            child: TextField(
                controller: _cityTextController,
                decoration: InputDecoration(labelText: 'City'),
                textAlign: TextAlign.center),
          ),
        ),
        ElevatedButton(onPressed: _search, child: Text('Search'))
      ],
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}