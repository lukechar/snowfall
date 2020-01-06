import 'package:flutter/material.dart';
import 'package:snowfall/services/snow_report.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:snowfall/services/snow_report.dart' as prefix0;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupSnowReport() async {
    SnowReport sr = SnowReport(resort: 'Copper Mountain', flag: 'usa.png', snowfallUrl: 'copper+mountain', currentWeatherUrl: '???');
    var res = await sr.getReport();
    if (res != 0) {
      sr.snowfall24 = 'None';
      sr.snowfall48 = 'None';
      sr.snowfall72 = 'None';
      sr.snowDescription = 'None';
      sr.snowfallPrediction = 'None';
    }
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'resort': sr.resort,
      'flag': sr.flag,
      'snowfall24': sr.snowfall24,
      'snowfall48': sr.snowfall48,
      'snowfall72': sr.snowfall72,
//      'temperature': sr.temperature,
      'snowDescription': sr.snowDescription,
      'snowfallPrediction': sr.snowfallPrediction,
    });
  }
  @override
  void initState() {
    super.initState();
    setupSnowReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
