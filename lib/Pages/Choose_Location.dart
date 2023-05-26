import 'package:flutter/material.dart';
import '../Services/World_Time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(URL: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(URL: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(URL: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(URL: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(URL: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(URL: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(URL: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(URL: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context, {
        'Location': instance.location,
        'Flag': instance.flag,
        'Time': instance.time,
        'isDayTime': instance.isDayTime,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
       backgroundColor: Colors.blue[900],
       title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }
     ),
    );
  }
}
