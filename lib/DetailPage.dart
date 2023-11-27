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
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Current Weather',
              style: TextStyle(
                color: themeModal.isDark ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor:
                themeModal.isDark ? Color(0xffB06892) : Color(0xffbfcfd8),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Settings(),
                    ));
                  },
                  icon: Icon(
                    Icons.settings,
                    color: themeModal.isDark ? Colors.white : Colors.black,
                    size: 30,
                  )),
            ],
          ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 190, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$a',
                              style: TextStyle(
                                fontSize: 32,
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                          child: Text(
                        '${apIprovider.weatherDataModal.current.tempC} °C',
                        style: TextStyle(
                          fontSize: 45,
                          color:
                              themeModal.isDark ? Colors.white : Colors.black,
                        ),
                      )),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${apIprovider.weatherDataModal.current.condition.text}',
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
                              '${apIprovider.weatherDataModal.current.cloud}',
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 10, right: 10),
                      child: Table(
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Day',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sunrise',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sunset',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '28/11',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tues',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunset}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '29/11',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Wed',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunset}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '30/11',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Thu',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunset}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '01/12',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Fri',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunset}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '02/12',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sat',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunset}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '03/11',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sun',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '04/12',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Monday',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunrise}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${apIprovider.weatherDataModal.forecast.forecastday[0].astro.sunset}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeModal.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
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
