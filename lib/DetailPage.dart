import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/ApiProvider.dart';
import 'package:sky_scrapper/Homepage.dart';
import 'package:sky_scrapper/Settings.dart';
import 'package:sky_scrapper/ThemeModal.dart';

class Detailpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Detailpagestate();
  }
}

class Detailpagestate extends State<Detailpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<APIprovider>(context, listen: false).Foruri();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, ThemeModal themeModal, child) {
        return Scaffold(
          backgroundColor:
              themeModal.isDark ? Color(0xffBD83C8) : Color(0xff60CDE4),
          body: FutureBuilder<void>(
            future: Provider.of<APIprovider>(context, listen: false).Foruri(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final apIprovider = Provider.of<APIprovider>(context);
                return Column(
                  children: [
                    SafeArea(
                      left: true,
                      bottom: true,
                      right: true,
                      top: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '$a',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '${apIprovider.weatherDataModal.location.region}, ${apIprovider.weatherDataModal.location.country}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Settings(),
                                ));
                              },
                              icon: Icon(
                                Icons.settings,
                                color: themeModal.isDark
                                    ? Colors.white
                                    : Colors.black,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
                    Center(
                        child: Text(
                      '${apIprovider.weatherDataModal.current.tempC} C',
                      style: TextStyle(
                        fontSize: 20,
                        color: themeModal.isDark ? Colors.white : Colors.black,
                      ),
                    )),
                    Center(
                      child: Row(
                        children: [
                          Text(
                            '${apIprovider.weatherDataModal.current.condition.text} C',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              '${apIprovider.weatherDataModal.current.windDegree} C',
                              style: TextStyle(
                                fontSize: 20,
                                color: themeModal.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Day',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Humidity',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Lowest Temp',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Highest Temp',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '28/11',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Tommorow',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '29/11',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Wednesday',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '30/11',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Thursday',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '01/12',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Friday',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '02/12',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Saturday',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '03/11',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Sunday',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            '04/12',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Monday',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.avghumidity}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.mintempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${apIprovider.weatherDataModal.forecast.forecastday[0].day.maxtempC}',
                            style: TextStyle(
                              fontSize: 20,
                              color: themeModal.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
