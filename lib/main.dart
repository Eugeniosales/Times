import 'package:flutter/material.dart';
import 'package:Times/screens/home.dart';
import 'package:Times/screens/locations.dart';
import 'package:Times/screens/loading.dart';

void main() => runApp(MaterialApp(
  title: 'Timer',
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Locations(),
  },
));