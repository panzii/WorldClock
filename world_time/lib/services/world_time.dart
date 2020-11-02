import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag; // url to flag image
  String url;  // url for api
  bool isDayTime; // true if day time false if night

  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async {
    //making a request.
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // getting properties from data
      String dateTime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);
      String isUtcPositive = data['utc_offset'].substring(0,1);
      //print(dateTime);

      DateTime now = DateTime.parse(dateTime);
      //print(now);
      now = isUtcPositive == '+' ? now.add(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes))) : now.subtract(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes)));;
      //print(now);

      isDayTime = now.hour >= 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e){
      print(e);
      time = "Could not get Time Data";

    }

  }


}