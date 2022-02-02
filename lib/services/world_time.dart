import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  bool? isDayTime;

  late String? location;
  late String? time;
  late String? flag;
  late String? url;

  WorldTime({this.location, this.flag, this.url});

  // ignore: empty_constructor_bodies
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String? offset = data['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      // print(now);
      now = now.add(Duration(hours: int.parse(offset)));

      // isDaytim= condition ? true : false
      isDayTime = now.hour >= 6 && now.hour <= 19 ? true : false;

      time = DateFormat.jm().format(now);

      // print(datetime);
      // print(offset);

      // print(datetime);
      // print(offset);

      // DateTime now=DateTime.parse(datetime);
      // now=now.add(Duration(hours: int.parse(datetime)));
      // print(now);
      // print(offset);
    } catch (e) {
      print("caught error");
    }
  }
}
