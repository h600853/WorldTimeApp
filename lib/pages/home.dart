import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutterapp/services/world_time.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
  data =  data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

  String bgImage = data['isDaytime'] ? 'day1.jpg' : 'night1.jpg';
  Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700] as Color;
  Color textColor = data['isDaytime'] ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
        children: <Widget>[
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: textColor,
                ),
                onPressed: () async {
               dynamic result = await Navigator.pushNamed(context, '/location');
               setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDaytime': result['isDaytime'],
                    'flag': result['flag'],
                  };
               });
                },
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit Location'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: textColor,
                    ),
                  ),
                const SizedBox(height: 20.0),
         ],
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: textColor,
                ),
              ),
              ],
              ),
            ),
          ),
      ),

    );
  }
}
