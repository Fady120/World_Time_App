import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  int f = 0;

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
   String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
   Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.blue[900];

   return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/Location');
                    if(result != null){
                      setState(() {
                        data = {
                          'Time': result['Time'],
                          'Location': result['Location'],
                          'isDayTime': result['isDayTime'],
                          'Flag': result['Flag']
                        };
                      });
                    }
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                    ),
                    label: Text(
                        'Edit Locations',
                         style: TextStyle(color: Colors.grey[300]),
                         ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['Location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                          color :Colors.white
                      ),
                    ),
                  ]
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['Time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                      color :Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
