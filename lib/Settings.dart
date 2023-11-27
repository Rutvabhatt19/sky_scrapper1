import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/ThemeModal.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Settingsstate();
  }
}

class Settingsstate extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, ThemeModal themeModal, child) {
        return Scaffold(
          backgroundColor:
              themeModal.isDark ? Color(0xffBD83C8) : Color(0xffbfcfd8),
          appBar: AppBar(
            backgroundColor:
                themeModal.isDark ? Color(0xffB06892) : Color(0xff60CDE4),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: themeModal.isDark ? Colors.white : Colors.black,
                  size: 30,
                )),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: themeModal.isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    themeModal.isDark = false;
                  },
                  child: fun(Icons.light_mode_outlined, 'Light Mode',
                      themeModal.isDark ? Colors.white : Colors.black)),
              Divider(
                  color: themeModal.isDark ? Colors.white : Colors.black,
                  height: 2),
              GestureDetector(
                  onTap: () {
                    themeModal.isDark = true;
                  },
                  child: fun(Icons.dark_mode_outlined, 'Dark Mode',
                      themeModal.isDark ? Colors.white : Colors.black)),
              Divider(
                  color: themeModal.isDark ? Colors.white : Colors.black,
                  height: 2),
            ],
          ),
        );
      },
    );
  }

  Widget fun(IconData a, String b, Color c) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              a,
              color: c,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                b,
                style: TextStyle(
                  color: c,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
