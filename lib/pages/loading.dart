import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = "loading...";
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: "Dhaka",  flag: "flag", url: "Asia/Dhaka");
    // if we want to use async fucntion we have to put await but we call this fuction
    // from another file so we what we have to do is put Future<> in that function we are call here
    await instance.getTime();
    // setState((){
    //   time = instance.time;
    // });
    // navigate to home screen and allso can send data to home
    // this data will go the _homeState inside widget build function
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag' : instance.flag,
      'isDayTime' : instance.isDayTime,
    });
  }
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
