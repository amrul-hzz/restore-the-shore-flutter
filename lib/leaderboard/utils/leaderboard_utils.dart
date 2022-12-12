import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:restore_the_shore_flutter/leaderboard/model/leader_board.dart';
import 'package:restore_the_shore_flutter/leaderboard/model/quote.dart';


Future<List<LeaderBoard>> fetchUsers(request) async {
  // TODO: Ganti ke url railway
  // var url = 'http://127.0.0.1:8000/group/$group_name/json-flutter/';
  var url = 'https://restore-the-shore.up.railway.app/leaderboard/json/';

  var response = await request.get(url);

// melakukan decode response menjadi bentuk json
//   var data = jsonDecode(utf8.decode(response.bodyBytes));

  var data = response;

// melakukan konversi data json menjadi object ToDo
  List<LeaderBoard> listUsers = [];
  for (var d in data) {
    if (d != null) {
      listUsers.add(LeaderBoard.fromJson(d));
    }
  }
  return listUsers;
}

Future<List<LeaderBoard>> fetchUsersSearch(request, String username) async {
  // TODO: Ganti ke url railway
  // var url = 'http://127.0.0.1:8000/group/$group_name/json-flutter/';
  var url = 'https://restore-the-shore.up.railway.app/leaderboard/search/$username/';

  var response = await request.get(url);

// melakukan decode response menjadi bentuk json
//   var data = jsonDecode(utf8.decode(response.bodyBytes));

  var data = response;

// melakukan konversi data json menjadi object ToDo
  List<LeaderBoard> listUsers = [];
  for (var d in data) {
    if (d != null) {
      listUsers.add(LeaderBoard.fromJson(d));
    }
  }

  return listUsers;
}

Future<List<Quote>> fetchQuote(request) async {
  // TODO: Ganti ke url railway
  // var url = 'http://127.0.0.1:8000/group/$group_name/json-flutter/';
  var url = 'https://restore-the-shore.up.railway.app/leaderboard/get-quote/';

  var response = await request.get(url);

// melakukan decode response menjadi bentuk json
//   var data = jsonDecode(utf8.decode(response.bodyBytes));

  var data = response;

// melakukan konversi data json menjadi object ToDo
  List<Quote> listQuote = [];

  if (data != null) {
    listQuote.add(Quote.fromJson(data));
  }

  return listQuote;
}

Future<dynamic> postQuote(CookieRequest request, String newQuote) async {
  // TODO: Ganti ke url railway
  // var url = 'http://127.0.0.1:8000/group/$group_name/json-flutter/';
  var url = 'https://restore-the-shore.up.railway.app/leaderboard/add-quote/';

  var response = await request.post(url, {
    "quote": newQuote
  });
  print(response); // dirty debug
  return response["message"];
}

