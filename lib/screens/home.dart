import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Map data = {};

  @override
  Widget build(BuildContext context) {
    
    data = data.isEmpty? ModalRoute.of(context).settings.arguments: data;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[500],
                  size: 15,
                ),
                label: Text(
                  'Edit location',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15
                  ),
                ),
                onPressed: () async {
                  dynamic place = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': place['location'],
                      'url': place['url'],
                      'time': place['time'],
                      'flag': place['flag']
                    };
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network('https://cdn.countryflags.com/thumbs/${data['flag']}/flag-round-250.png', width: 50,), 
                  SizedBox(width: 20,),
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 40,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ]
          ),
        )
      ),
    );
  }
}