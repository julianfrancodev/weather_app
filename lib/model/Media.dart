class Main {
  double temp;
  double feels_like;
  int presure;
  double temp_min;
  double temp_max;
  int humidity;
  int sea_level;

  Main(
      {this.temp,
      this.feels_like,
      this.presure,
      this.temp_min,
      this.temp_max,
      this.humidity,
      this.sea_level});

    factory Main.fromJson(Map<String, dynamic> json){
      return Main(
        temp: json['temp'] as double,
        feels_like: json['feels_like'] as double,
        presure: json['presure'] as int,
        temp_min: json['temp_min'] as double,
        temp_max: json['temp_max'] as double,
        humidity: json['humidity'] as int,
        sea_level: json['sea_level'] as int
      );
  }
}
