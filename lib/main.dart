import 'package:flutter/material.dart';
import 'package:worldtimeapp/Pages/Choose_Location.dart';
import 'package:worldtimeapp/Pages/Home.dart';
import 'package:worldtimeapp/Pages/Loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/Home': (context) => const Home(),
    '/Location': (context) => const ChooseLocation(),
  },
));
