import 'package:flutter/material.dart';
import 'package:Times/services/world_time.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  List <WorldTime> places = [
    WorldTime(location: 'Berlim', flag: 'germany', url: 'Europe/Berlin'),
    WorldTime(location: 'Buenos Aires', flag: 'argentina', url: 'America/Buenos_Aires'),
    WorldTime(location: 'Lisboa', flag: 'portugal', url: 'Europe/Lisbon'),
    WorldTime(location: 'Antenas', flag: 'greece', url: 'Europe/Anthens'),
    WorldTime(location: 'Brasília', flag: 'brazil', url: 'America/Brasilia'),
    WorldTime(location: 'Londres', flag: 'united-kingdom', url: 'Europe/London'),
    WorldTime(location: 'Madrid', flag: 'spain', url: 'Europe/Madrid'),
    WorldTime(location: 'Cairo', flag: 'egypt', url: 'Africa/Cairo'),
    WorldTime(location: 'New York', flag: 'united-states-of-america', url: 'America/New_York'),
  ];

  void updateTime(index) async {
    WorldTime place = places[index];
    await place.getTime();
    Navigator.pop(context, {
      'location': place.location,
      'url': place.url,
      'flag': place.flag,
      'time': place.time
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
        elevation: 0.0
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