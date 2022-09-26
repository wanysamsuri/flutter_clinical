import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/home_page.dart';
import 'package:flutter_clinic/screens/signin_page.dart';
import 'package:flutter_clinic/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/homepage_page': ((context) => new Homepage()),
          '/signin_page': ((context) => new Signinpage()),
        },
        home: const Welcome());
  }
}
