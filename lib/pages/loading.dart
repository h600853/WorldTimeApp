import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Oslo', flag: 'norway.png', url: 'Europe/Oslo');
   await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
      'isDaytime': instance.isDaytime,
   });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue[900],
          size: 80.0,
      )
      )
    );
  }
}
