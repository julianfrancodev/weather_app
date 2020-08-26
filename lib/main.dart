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
  Future<Weather> futureWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeather = HttpHandler().fetchWeather();
  }

  double _celsiusParser(double kelvin) {
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
                      image: AssetImage('assets/images/image2.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.4),
                    ])),
              ),
            ),
            Container(
              height: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder(
                        future: futureWeather,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                Text(
                                  snapshot.data.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            FutureBuilder(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_celsiusParser(snapshot.data.main.temp)}" +
                                  "\u00B0",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 60,
                                  color: Colors.white),
                            ),
                          ]),
                      Text("Lluvia",
                        style: TextStyle(fontSize: 20, color: Colors.white),)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Container();
              },
            ),

          ],
        ));
  }
}
