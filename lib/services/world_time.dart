import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url}): time = '', isDaytime = false;

  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3))));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.Hm().format(now);
    }catch(e){
      time = 'could not get time data';
    }

  }
}
