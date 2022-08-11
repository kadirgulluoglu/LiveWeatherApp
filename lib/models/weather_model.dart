class Weather {
  String? cityName;
  String? icon;
  var temp;
  var humidity;
  var wind;
  var windDirection;
  var lastUpdate;
  var condition;
  var uv;
  var pressure;
  Weather({
    this.cityName,
    this.icon,
    this.temp,
    this.humidity,
    this.wind,
    this.lastUpdate,
    this.condition,
    this.uv,
    this.pressure,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    windDirection = json['current']['wind_dir'];
    humidity = json['current']['humidity'];
    pressure = json['current']['pressure_mb'];
    lastUpdate = json['current']['last_updated'];
    uv = json['current']['uv'];
  }
}
