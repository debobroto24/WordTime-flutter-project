import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location name for ui
  // time in that location
  String time = '' ;
  String flag; // url to an asset flag icon
  String url ; // url for api end point
  bool isDayTime = false;
  WorldTime({required this.location ,required this.url , required this.flag});
  // WorldTime( this.location , this.url ,  this.flag);


  Future<void> getTime() async {
    try{
      // String time;
      Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      // print(response.body);
      Map data = jsonDecode(response.body);
      print(data);
      String datetime = data['datetime'];
      // output of print(offset) +01:00 we need the number so we get only 01 by substring(1,3)
      String offset = data['utc_offset'].substring(1,3);
      print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));
      // time = now.toString();// convert time as string
      // using intl formating


      time = DateFormat.jm().format(now);

      isDayTime    = now.hour>6 && now.hour<20 ? true : false;

      print(now);
    }catch(error){
      time = 'Someting messedup ! could not get the time';
    }



    // String name = await Future.delayed(Duration(seconds: 3),(){
    // return "yoshi";
    // });
    //
    // String detail = await Future.delayed(Duration(seconds: 2),(){
    //   return "His name is";
    // });
    // print('$detail : $name');
  }
}


