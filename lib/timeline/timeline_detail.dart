library umkm;

import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';

import 'dart:convert' as convert;

import 'package:restore_the_shore_flutter/timeline/util/fetch.dart';

import 'models/timeline_model.dart';

class TimelineDetailPage extends StatelessWidget {
  final Timeline timelineData;
  static const ROUTE_NAME = "/timeline_detail";
  const TimelineDetailPage({Key? key, required this.timelineData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Join this event"))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Column(
              children: [
                Image.network("${timelineData.fotoPantai}"),
                Text(
                  "${timelineData.namaEvent}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "${timelineData.namaPantai}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "${timelineData.alamatPantai}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "${timelineData.jumlahPartisipan}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "${timelineData.deskripsi}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "${timelineData.tanggalMulai?.day}/${timelineData.tanggalMulai?.month}/${timelineData.tanggalMulai?.year} - ${timelineData.tanggalAkhir?.day}/${timelineData.tanggalAkhir?.month}/${timelineData.tanggalAkhir?.year}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ));
  }
}
