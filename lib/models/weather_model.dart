class Weather {
  String? cityName;
  String? icon;
  int? isDay;
  var temp;
  var humidity;
  var wind;
  var windDirection;
  var lastUpdate;
  var condition;
  var cloud;
  Weather(
      {this.cityName,
      this.icon,
      this.temp,
      this.humidity,
      this.wind,
      this.condition,
      this.cloud,
      this.isDay});
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    windDirection = json['current']['wind_dir'];
    humidity = json['current']['humidity'];
    isDay = json['current']['is_day'];
    lastUpdate = json['current']['last_updated'];
    cloud = json['current']['cloud'];
  }
}
