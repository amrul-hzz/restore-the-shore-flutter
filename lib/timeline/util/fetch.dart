// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/timeline_model.dart';

Future<List<Timeline>> fetchTimeline() async {
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

  // melakukan konversi data json menjadi object ToDo

  List<Timeline> listTimeline = [];
  for (var d in data) {
    print(d);
    if (d != null) {
      listTimeline.add(Timeline.fromJson(d));
    }
  }

  return listTimeline;
}
