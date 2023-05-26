import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String URL;
  String location;
  late String time;
  String flag;
  late bool isDayTime;

  WorldTime({
    required this.location, required this.URL, required this.flag
  });

  Future<void> getTime() async
  {
    try
    {
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$URL');
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      var datetime = data['datetime'];
      var offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime =  (now.hour >= 6) && (now.hour < 12) ? true : false;
      print(now.hour);
      time = DateFormat.jm().format(now);
    }

    catch(e)
    {
       if (kDebugMode) {
         print('Caught error: $e');
         time = 'Could not get time data';
       }
    }

  }
}


