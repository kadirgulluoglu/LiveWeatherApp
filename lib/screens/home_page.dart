import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/services/getLocation.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';

var dayInfo = DateTime.now();

var dateFormat = DateFormat(
  'EEE, d MMM, yyyy',
).format(dayInfo);

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String? imgUrl;
  var data;
  info() async {
    var position = await getPosition();
    data = await WeatherData().getData(position.latitude.toStringAsFixed(2),
        position.longitude.toStringAsFixed(2));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            if (data.isDay == 1) {
              if (data?.condition == 'Sunny' || data?.condition == 'Clear') {
                imgUrl = 'assets/images/sunny.jpg';
              } else if (data?.condition == 'Rainy') {
                imgUrl = 'assets/images/rainy.jpg';
              } else if (data?.condition == 'Overcast') {
                imgUrl = 'assets/images/cloudy.jpeg';
              }
            } else {
              imgUrl = 'assets/images/night.jpg';
            }

            return Container(
              child: Stack(
                children: [
                  Image.asset(
                    imgUrl!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black38),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.2,
                                  ),
                                  Text(
                                    data?.cityName,
                                    style: TextStyle(
                                      fontSize: size.height * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .001,
                                  ),
                                  Text(
                                    dateFormat,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data!.temp.toString(),
                                        style: TextStyle(
                                          fontSize: 85,
                                          fontWeight: FontWeight.w300,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        "\u2103",
                                        style: TextStyle(
                                          fontSize: 85,
                                          fontWeight: FontWeight.w300,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  data.isDay == 1
                                      ? Row(
                                          children: [
                                            Icon(Icons.wb_sunny_outlined,
                                                color: white, size: 34),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Day" + " - " + data.condition,
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Icon(Icons.nightlight_outlined,
                                                color: white, size: 34),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Night" + " • " + data.condition,
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 40),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: white.withOpacity(0.3),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Wind',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        data!.wind.toString(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        'km/h',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Cloud',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        data.cloud.toString(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        '%',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Humidy',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        data.humidity.toString(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                      Text(
                                        '%',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
