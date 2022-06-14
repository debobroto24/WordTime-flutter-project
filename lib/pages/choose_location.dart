import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocaiton extends StatefulWidget {
  @override
  State<ChooseLocaiton> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocaiton> {
  List<WorldTime> locations = [
    WorldTime(location: "Dhaka", url: "Asia/Dhaka",  flag: "Dhaka.png",),
    WorldTime(location:'Anadyr', url:'Asia/Anadyr',flag:'Anadyr.png'),
    WorldTime(location:'Atyrau', url:'Asia/Atyrau',flag:'Atyrau.png'),
    WorldTime(location:'Nicosia' ,url:'Asia/Nicosia',flag:'Nicosia.png'),
    WorldTime(location:'Dili', url:'Asia/Dili',flag:'Dili.png'),
    WorldTime(location:'Delhi' ,url:'Asia/Delhi',flag:'Delhi.png'),
    WorldTime(location:'Tomsk', url:'Asia/Tomsk',flag:'Tomsk.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context , {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time ,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    print("inside build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("choose Loaction"),
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
                child: Card(
                  child:ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(
                      locations[index].location,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.0,
                      ),
                    ),
                    //leading is an leading image
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                )
            );
          },
      ),
    );
  }
}
