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
    WorldTime instance = WorldTime(location: 'Londres', flag: 'united-kingdom', url: 'Europe/London', picture: 'https://images.unsplash.com/photo-1454793147212-9e7e57e89a4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=614&q=80');
    
    await instance.getTime();
    
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'picture': instance.picture
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