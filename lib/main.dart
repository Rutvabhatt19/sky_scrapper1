import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/ApiProvider.dart';
import 'package:sky_scrapper/Splashscreen.dart';
import 'package:sky_scrapper/ThemeModal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeModal(),
      ),
      ChangeNotifierProvider(
        create: (context) => APIprovider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splaschscreen(),
    );
  }
}
