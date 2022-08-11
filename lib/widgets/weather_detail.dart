import 'package:flutter/material.dart';

import '../theme/colors.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                      "Bozova",
                      style: TextStyle(
                        fontSize: size.height * 0.08,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "2020 PAZARTESİ",
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
                          "30",
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
                    Row(
                      children: [
                        Icon(
                          Icons.nightlight_outlined,
                          size: 34,
                          color: white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Night",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ],
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "80",
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
                          'Rain',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        Text(
                          "60",
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
                          "80",
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
    );
  }
}
