import 'package:flutter/material.dart';
import 'package:Times/services/world_time.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

    int _selectedIndex = 0;

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


  void setUpDate() async {
    WorldTime instance = WorldTime(location: 'Londres', flag: 'united-kingdom', url: 'Europe/London', picture: 'https://images.unsplash.com/photo-1454793147212-9e7e57e89a4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=614&q=80');
    
    await instance.getTime();
    
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'picture': instance.picture
    });
  }

    switch(index){
      case 0:
        setUpDate();
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/map');
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[900],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,

          ),
          title: Text(
            'Home',
            style: TextStyle(

            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,

          ),
          title: Text(
            'Map',
            style: TextStyle(

            ),
          )
        )
      ]
    );
  }
}