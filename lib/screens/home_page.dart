import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/getLocation.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';

var dayInfo = DateTime.now();

var dateFormat = DateFormat(
  'EEE, d MMM, yyyy',
).format(dayInfo);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imgUrl;

  Weather data = Weather();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            getBackgroundImage(data);
            return Stack(
              children: [
                buildBackgroundImage(),
                buildImageFilter(),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCityName(size),
                      buildWeatherDetails(),
                    ],
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            return buildSnapshotHasErrorWidget();
          } else {
            return buildLoadingIndicator();
          }
        }),
      ),
    );
  }

  Center buildSnapshotHasErrorWidget() =>
      const Center(child: Text("Apiden veri çekilemedi"));

  info() async {
    var position = await getPosition();
    data = await WeatherData().getData(position.latitude.toStringAsFixed(2),
        position.longitude.toStringAsFixed(2));
    return data;
  }

  getBackgroundImage(var data) {
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
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.search,
          size: 30,
          color: white,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: white,
          ),
        )
      ],
    );
  }

  Container buildImageFilter() {
    return Container(
      decoration: const BoxDecoration(color: Colors.black38),
    );
  }

  Center buildLoadingIndicator() =>
      const Center(child: CircularProgressIndicator(color: primary));

  Column buildWeatherDetails() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            border: Border.all(
              color: white.withOpacity(0.3),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Wind',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  Text(
                    data.wind.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const Text(
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
                  const Text(
                    'Cloud',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  Text(
                    data.cloud.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const Text(
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
                  const Text(
                    'Humidy',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  Text(
                    data.humidity.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const Text(
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
    );
  }

  Expanded buildCityName(Size size) {
    return Expanded(
      flex: 8,
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
                data.cityName.toString(),
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
                style: const TextStyle(
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
                    data.temp.toString(),
                    style: const TextStyle(
                      fontSize: 85,
                      fontWeight: FontWeight.w300,
                      color: white,
                    ),
                  ),
                  const Text(
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
                        const Icon(Icons.wb_sunny_outlined,
                            color: white, size: 34),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Day" " • " + data.condition.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const Icon(Icons.nightlight_outlined,
                            color: white, size: 34),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Night" " • " + data.condition.toString(),
                          style: const TextStyle(
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
    );
  }

  Image buildBackgroundImage() {
    return Image.asset(
      imgUrl!,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
