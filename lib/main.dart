import 'package:flutter/material.dart';
import 'package:news_app1/providers/news_provider.dart';
import 'package:news_app1/screens/details.dart';
import 'package:news_app1/screens/home.dart';
import 'package:news_app1/screens/specific.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'News app',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => Home(),
          'details': (context) => Details(),
          'specific': (context) => Specific(),
        },
        initialRoute: 'home',
      ),
    );
  }
}
