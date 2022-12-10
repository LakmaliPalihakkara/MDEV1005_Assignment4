import 'package:assignment4/data_service.dart';
import 'package:flutter/material.dart';
import 'models.dart';

//Class to display weather details in Weather API screen
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
    return Scaffold(
      appBar: AppBar(title: Text('Weather API')),
      body: Center(
      child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: Text('Weather API',
                    style: TextStyle(fontSize: 30,color: Colors.blue)
                )),
            Padding(
                padding: EdgeInsets.all(15),
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
                style: TextStyle(fontSize: 40),
              ),
              Text(_response!.weatherInfo.description,
    style: TextStyle(fontSize: 12)),


              Text(
                'Feels like ${_response!.tempInfo.feelsLikeTemp}° F',
                  style: TextStyle(fontSize: 12)
              )

            ],
          ),

        if(_response == null)
          Column(
            children: [
              Text('--',
                style: TextStyle(fontSize: 30),)
            ],
          ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
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
    )
      ) );
  }
// Passes the city name and gets back the weather details as response
  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}