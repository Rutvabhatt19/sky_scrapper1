import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/Homepage.dart';
import 'package:sky_scrapper/ThemeModal.dart';

class Splaschscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splashscreenstate();
  }
}

class Splashscreenstate extends State<Splaschscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Homepage(),
      )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, ThemeModal themeModal, child) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 811,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        themeModal.isDark
                            ? 'Assates/Images/Splashscreen2.jpeg'
                            : 'Assates/Images/splashccreen1.jpg',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
