import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Times/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override

  void setUpDate() async {
    WorldTime instance = WorldTime(url: 'Europe/Lisbon', location: 'Lisboa', flag: 'lisbon.png');
    
    await instance.getTime();
    
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time
      });
    });
  }

  void initState() {
    super.initState();
    setUpDate();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SpinKitFoldingCube(
          color: Colors.pink,
          size: 80.0,
        )
      )
    );
  }
}