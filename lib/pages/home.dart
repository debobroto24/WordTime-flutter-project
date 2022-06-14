import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //receiving data from loading setate by naviagtor from 22 number line
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map ;
    print("data is ");
    print(data);

    // String bgImage  =  data['isDayTime'] ? 'day.jpg': 'night.jpg';
    String bgImage  =  'night.jpg';

    // Color bgColor  =  (data['isDayTime'] ? Colors.blue : Colors.indigo[700]) as Color;
    return Scaffold(
      backgroundColor: Colors.indigo,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:Text("Home Screen"),
      //   elevation: 0,
      //   backgroundColor: Colors.blueAccent,
      // ),
      body:SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child:Padding(
                  padding:EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                  child:Column(
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: () async{
                         dynamic result = await Navigator.pushNamed(context, '/location');
                          setState((){
                            data = {
                              'time' : result['time'],
                              'location' : result['location'],
                              'isDayTime' : result['isDayTime'],
                              'flag' : result['flag'],
                            };
                          });
                        },
                        icon:Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                        ),
                        label: Text(
                          "Edit Location",
                          style:TextStyle(
                            color:Colors.grey[300],
                            fontSize:18,
                          ),
                        ),
                        // color:Colors.redAccent,
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color:Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                          color:Colors.white,
                        ),
                      ),
                    ],
                  )
              )
          ),
      ),
    );
  }
}
