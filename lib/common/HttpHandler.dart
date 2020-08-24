import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/Contants.dart';
import 'package:weather_app/model/Weather.dart';

class HttpHandler{
  final String baseUrl = 'api.openweathermap.org';
  final String path = '/data/2.5/weather';

  Future<dynamic> getJson(Uri uri) async {
      http.Response response = await http.get(uri);
      return json.decode(response.body);
  }

  Future<Weather> fetchWeather(){
    var uri = new Uri.http(baseUrl,path,{'q':'Tunja,co','appid':API_KEY});
    return getJson(uri).then((value) =>
      Weather.fromJson(value)
    );
  }

}