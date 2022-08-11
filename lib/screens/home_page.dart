import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/services/getLocation.dart';
import 'package:weather_app/widgets/weather_detail.dart';

import '../theme/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var data;
  info() async {
    var position = await getPosition();
    data = await WeatherData().getData(position.latitude.toStringAsFixed(2),
        position.longitude.toStringAsFixed(2));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30,
              color: white,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Stack(
                children: [
                  Image.network(
                    "https://c0.wallpaperflare.com/preview/133/882/513/nature-weather-outdoors-night.jpg",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black38),
                  ),
                  WeatherDetail(),
                ],
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(color: Colors.blueGrey));
          }
        }),
      ),
    );
  }
}
