
import 'package:weather_app/model/Main.dart';

class Weather {
  int id;
  String name;
  Main main;

  Weather({this.id, this.name, this.main});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'] as int,
        name: json['name'] as String,
        main: Main.fromJson(json['main']));
  }
}
