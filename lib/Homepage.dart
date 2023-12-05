import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/DetailPage.dart';
import 'package:sky_scrapper/Settings.dart';
import 'package:sky_scrapper/ThemeModal.dart';
import 'package:textfield_search/textfield_search.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homepagestate();
  }
}

class Homepagestate extends State<Homepage> {
  void _showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? result == ConnectivityResult.mobile
            ? 'You are Connected to mobile network'
            : "You are  connected to wi-fi network"
        : "You have no internet";
    final color = hasInternet ? Colors.green : Colors.red;
    _showSnackBar(context, message, color);
  }

  void _showSnackBar(BuildContext context, String? message, Color color) {
    final snackBar = SnackBar(
      content: Text(message!),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController _textEditingController = TextEditingController();
  List<String> cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Ahmedabad',
    'Chennai',
    'Kolkata',
    'Surat',
    'Pune',
    'Jaipur',
    'Lucknow',
    'Kanpur',
    'Nagpur',
    'Indore',
    'Thane',
    'Bhopal',
    'Visakhapatnam',
    'Pimpri-Chinchwad',
    'Patna',
    'Vadodara',
    'Ghaziabad',
    'Ludhiana',
    'Agra',
    'Nashik',
    'Faridabad',
    'Meerut',
    'Rajkot',
    'Kalyan-Dombivali',
    'Vasai-Virar',
    'Varanasi',
  ];
  late StreamSubscription Sub;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Sub =
        Connectivity().onConnectivityChanged.listen(_showConnectivitySnackBar);
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
              'Weather App',
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
          body: Column(
            children: [
              TextFieldSearch(
                label: 'Search Your City',
                controller: _textEditingController,
                initialList: cities,
              ),
              ElevatedButton(
                  onPressed: () {
                    a = _textEditingController.text;
                    print(a);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detailpage(),
                    ));
                  },
                  child: Text(
                    'Done',
                  ))
            ],
          ),
        );
      },
    );
  }
}

String a = '';
