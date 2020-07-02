import 'package:flutter/material.dart';
import 'package:Times/widgets/bottomNavigation.dart';


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  TextEditingController _number = TextEditingController();

  String _text = 'Nenhum número';

  void _showInfo() {
    setState(() {
      _text = _number.text;
    });

    _number.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh), 
            onPressed: () {
              _number.text = '';
            },
          )
        ]
      ),
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1464852045489-bccb7d17fe39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                controller: _number,
                decoration: InputDecoration(
                  labelText: 'Digite seu número',
                  labelStyle: TextStyle(
                    color: Colors.white
                  )
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: RaisedButton.icon(
                  onPressed: () {
                    _showInfo();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)
                  ),
                  color: Colors.black, 
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ), 
                  label: Text('Enviar', 
                  style: TextStyle(
                    color: Colors.white),
                  )
                )
              ),
              Text('$_text', style: TextStyle(color: Colors.white, fontSize: 30),)
            ],
          )
        )
      ) 
      )
    );
  }
}