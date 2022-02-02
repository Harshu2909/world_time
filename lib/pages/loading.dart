// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = "Loading";
  

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    // print(instance.time);
    // setState(() {
    //   time=instance.time!;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDayTime
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
      backgroundColor: Colors.teal,
      // body: Padding(
      //   padding: EdgeInsets.all(50),
      //   child: Text("loading"),
      body: Center(
        child:  SpinKitCircle(
  color: Colors.white,
  size: 80.0,
),),
      
    );
  }
}
