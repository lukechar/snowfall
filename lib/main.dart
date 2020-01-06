import 'package:flutter/material.dart';
import 'package:snowfall/pages/home.dart';
import 'package:snowfall/pages/loading.dart';
import 'package:snowfall/pages/choose_resort.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/choose_resort': (context) => ChooseResort(),
  },
));
