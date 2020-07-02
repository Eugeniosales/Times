import 'package:flutter/material.dart';
import 'package:Times/services/world_time.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  List <WorldTime> places = [
    WorldTime(location: 'Berlim', flag: 'germany', url: 'Europe/Berlin', picture: 'https://images.unsplash.com/photo-1552041634-04684f1aeeb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
    WorldTime(location: 'Buenos Aires', flag: 'argentina', url: 'America/Buenos_Aires', picture: 'https://images.unsplash.com/photo-1577801599718-f4e3ad3fc794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
    WorldTime(location: 'Shanghai', flag: 'china', url: 'Asia/Shanghai', picture: 'https://images.unsplash.com/photo-1529921879218-f99546d03a9d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
    WorldTime(location: 'Porto', flag: 'portugal', url: 'Europe/Lisbon', picture: 'https://images.unsplash.com/photo-1511968822213-92de73315bba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
    WorldTime(location: 'Atenas', flag: 'greece', url: 'Europe/Athens', picture: 'https://images.unsplash.com/photo-1574367826667-c239af0e0e9e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
    WorldTime(location: 'Brasília', flag: 'brazil', url: 'America/Sao_Paulo', picture: 'https://images.unsplash.com/photo-1593458018624-21ae71908e8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80'),
    WorldTime(location: 'Londres', flag: 'united-kingdom', url: 'Europe/London', picture: 'https://images.unsplash.com/photo-1454793147212-9e7e57e89a4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=614&q=80'),
    WorldTime(location: 'Madrid', flag: 'spain', url: 'Europe/Madrid', picture: 'https://images.unsplash.com/photo-1578305698944-874fa44d04c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
    WorldTime(location: 'Cairo', flag: 'egypt', url: 'Africa/Cairo', picture: 'https://images.unsplash.com/photo-1558311728-c3407ad09492?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80'),
    WorldTime(location: 'Nova York', flag: 'united-states-of-america', url: 'America/New_York', picture: 'https://images.unsplash.com/photo-1534270804882-6b5048b1c1fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=650&q=80'),
  ];

  void updateTime(index) async {
    WorldTime place = places[index];
    await place.getTime();
    Navigator.pop(context, {
      'location': place.location,
      'url': place.url,
      'flag': place.flag,
      'time': place.time,
      'picture': place.picture
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Locations'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Card(
                color: Colors.grey[850],
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    places[index].location,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Image.network('https://cdn.countryflags.com/thumbs/${places[index].flag}/flag-round-250.png'), 
                  ),
                )
              ),
            );
          },
        )
      )
    );
  }
}