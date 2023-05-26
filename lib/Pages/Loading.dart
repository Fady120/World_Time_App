import 'package:flutter/material.dart';
import 'package:worldtimeapp/Services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Cairo', flag: 'Egypt.png', URL: 'Africa/Cairo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'Location': instance.location,
      'Flag': instance.flag,
      'Time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }


  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: const Center(
            child: SpinKitWave(
            color: Colors.white,
           size: 80.0,
        ),
        )
    );
  }
}
