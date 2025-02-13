import 'package:flutter/material.dart';
import 'package:Times/widgets/bottomNavigation.dart';

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
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data['picture']),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Container(

                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network('https://cdn.countryflags.com/thumbs/${data['flag']}/flag-round-250.png', width: 60,), 
                      SizedBox(width: 20,),
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 35,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 20),
                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['time'],
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: RaisedButton.icon(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                    ),
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[100],
                      size: 20,
                    ),
                    label: Text(
                      'Edit location',
                      style: TextStyle(
                        color: Colors.grey[100],
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
                          'flag': place['flag'],
                          'picture': place['picture']
                        };
                      });
                    },
                  ),
                ),
              ]
            ),
        ),
        ),
      ),
    );
  }
}