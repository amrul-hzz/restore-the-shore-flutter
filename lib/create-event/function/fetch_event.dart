import 'package:restore_the_shore_flutter/create-event/models/event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<EventList>> fetchEventList() async {
  var url =
      Uri.parse('https://restore-the-shore.up.railway.app/create-event/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object WatchList
  List<EventList> listEventList = [];
  for (var d in data) {
    if (d != null) {
      listEventList.add(EventList.fromJson(d));
    }
  }

  return listEventList;
}
