import 'package:flutter/material.dart';
import 'package:snowfall/services/snow_report.dart';

class ChooseResort extends StatefulWidget {
  @override
  _ChooseResortState createState() => _ChooseResortState();
}

class _ChooseResortState extends State<ChooseResort> {

  List<SnowReport> resorts = [
    SnowReport(resort: 'Breckenridge', flag: 'usa.png', snowfallUrl: 'breckenridge', currentWeatherUrl: 'todo'),
    SnowReport(resort: 'Copper Mountain', flag: 'usa.png', snowfallUrl: 'copper+mountain', currentWeatherUrl: 'todo'),
    SnowReport(resort: 'Arapahoe Basin', flag: 'usa.png', snowfallUrl: 'arapahoe+basin', currentWeatherUrl: 'todo'),
  ];

  void updateSnowReport(index) async {
    SnowReport sr = resorts[index];
    var res = await sr.getReport();
    if (res != 0) {
      sr.snowfall24 = 'None';
      sr.snowfall48 = 'None';
      sr.snowfall72 = 'None';
      sr.snowDescription = 'None';
      sr.snowfallPrediction = 'None';
    }
    Navigator.pop(context, '/home', arguments: {
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: resorts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateSnowReport(index);
                  },
                  title: Text(resorts[index].resort),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${resorts[index].flag}'),
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
