import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String picture;
  String url;

  WorldTime({ this.url, this.flag, this.location, this.picture });

    Future <void> getTime() async {
      try {
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        
        String dateTime = data['datetime'];
        
        DateTime now = DateTime.parse(dateTime);
        time = DateFormat().format(now);
      } catch(e) {
        time = 'Time undefined';
      }
    }

}