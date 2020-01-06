import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    print(data);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          // TODO: add background image
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/$bgImage'),
//                fit: BoxFit.cover,
//              ),
//            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/choose_resort');
                        setState(() {
                          data = {
                            'resort': result['resort'],
                            'flag': result['flag'],
                            'snowfall24': result['snowfall24'],
                            'snowfall48': result['snowfall48'],
                            'snowfall72': result['snowfall72'],
                            'snowDescription': result['snowDescription'],
                            'snowfallPrediction': result['snowfallPrediction'],
                          };
                        });
                      },
                      icon: Icon(Icons.location_searching),
                      label: Text('Choose Resort')
                  ),
                  Text(data['resort']),
                  Text('24 Hour Snowfall: ' + data['snowfall24'] + '\"'),
                  Text('48 Hour Snowfall: ' + data['snowfall48'] + '\"'),
                  Text('72 Hour Snowfall: ' + data['snowfall72'] + '\"'),
                  Text('Today\'s Snow Conditions'),
                  Text('Description: ' + data['snowDescription']),
                  Text('Snowfall Prediction: ' + data['snowfallPrediction'] + '\"'),
                ],
              ),
            )
        ),
        ),
      );
  }
}
