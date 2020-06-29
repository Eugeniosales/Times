import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.url, this.flag, this.location });

    Future <void> getTime() async {
      try {
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        
        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        
        DateTime now = DateTime.parse(dateTime).add(Duration(hours: int.parse(offset)));
        time = DateFormat().format(now);
      } catch(e) {
        time = 'Time undefined';
      }
    }

}