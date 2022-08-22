class Weather {
  String? cityName;
  String? icon;
  int? isDay;
  double? temp;
  int? humidity;
  double? wind;
  String? condition;
  int? cloud;
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
    humidity = json['current']['humidity'];
    isDay = json['current']['is_day'];
    cloud = json['current']['cloud'];
  }
}
