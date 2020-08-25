import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/common/HttpHandler.dart';
import 'package:weather_app/model/Main.dart';
import 'package:weather_app/model/Weather.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Weather _weather;
  Main _mainWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadWeather();
  }

  void loadWeather() async {
    var weather = await HttpHandler().fetchWeather();
    print(weather.name);
    print(weather.main.temp);
    print(weather.main.temp_max);
    print(weather.main.humidity);
    print(weather.main.temp_min);

    setState(() {
      _mainWeather = new Main(
          sea_level: weather.main.sea_level,
          humidity: weather.main.humidity,
          temp_max: weather.main.temp_max,
          temp_min: weather.main.temp_min,
          temp: weather.main.temp,
          presure: weather.main.presure,
          feels_like: weather.main.feels_like);
      _weather =
          new Weather(id: weather.id, name: weather.name, main: _mainWeather);
    });
  }

  double _celsiusParser(double kelvin){
    return (kelvin - 273.15).roundToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image1.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.4),
            ])),
          ),
        ),
        Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weather.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.ac_unit,color: Colors.white,),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${_celsiusParser(_weather.main.temp)}',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
