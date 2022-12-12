// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/timeline_model.dart';

Future<List<Timeline>> fetchTimeline() async {
  var name = "timeline";
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
    if (d != null) {
      listTimeline.add(Timeline.fromJson(d));
    }
  }

  return listTimeline;
}

Future<List<Timeline>> fetchSearch(String alamat) async {
  var name = "search";
  var url =
  Uri.parse('https://restore-the-shore.up.railway.app/create-event/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
    },
  );

  // decode response to json
  var data = json.decode(response.body);

  // convert json to list of food rec model
  List<Timeline> listSearch = [];
  for (var i in data) {
    if (i != null) {
      if (i["fields"]["alamatPantai"].toLowerCase().contains(alamat)) {
        listSearch.add(Timeline.fromJson(i));
      }
    }
  }

  return listSearch;
}