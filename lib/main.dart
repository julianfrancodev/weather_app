import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/common/HttpHandler.dart';


void main(){
  runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Home(),
   )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadWeather();
  }

  void loadWeather () async {
    var weather  = await HttpHandler().fetchWeather();
    print(weather.name);
    print(weather.main.temp);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("hola mundo"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
