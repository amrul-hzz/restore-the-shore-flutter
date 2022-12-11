library umkm;

import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/timeline/timeline_detail.dart';

import 'dart:convert' as convert;
import 'dart:math';

import 'package:restore_the_shore_flutter/timeline/util/fetch.dart';

class TimelineHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/timeline_home";
  const TimelineHomePage({super.key});

  @override
  State<TimelineHomePage> createState() => _TimelineHomePageState();
}

class _TimelineHomePageState extends State<TimelineHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: FutureBuilder(
          future: fetchTimeline(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "There is no data yet :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 2),
                          itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 180, 167, 167),
                                          blurRadius: 1.0)
                                    ]),
                                child: ListTile(
                                  onTap: () {},
                                  title: Container(
                                    width: 150,
                                    height: 150,
                                    child: Image.network(
                                        "${snapshot.data![index].fotoPantai}"),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].namaPantai}",
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        "${snapshot.data![index].alamatPantai}",
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        "${snapshot.data![index].tanggalMulai?.day}/${snapshot.data![index].tanggalMulai?.month}/${snapshot.data![index].tanggalMulai?.year} - ${snapshot.data![index].tanggalAkhir?.day}/${snapshot.data![index].tanggalAkhir?.month}/${snapshot.data![index].tanggalAkhir?.year}",
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      ElevatedButton(
                                          // onPressed: () {
                                          //   Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             TimelineDetailPage(
                                          //                 snapshot.data![index]: snapshot
                                          //                     .data![index])),
                                          //   );
                                          // },
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                    scrollable: true,
                                                    content: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image(
                                                                // width: 250,
                                                                // height: 250,
                                                                image: NetworkImage(
                                                                    "${snapshot.data![index].fotoPantai}")),
                                                            Text(
                                                              "${snapshot.data![index].namaEvent}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              "${snapshot.data![index].namaPantai}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              "${snapshot.data![index].alamatPantai}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              "${snapshot.data![index].jumlahPartisipan}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              "${snapshot.data![index].deskripsi}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              "${snapshot.data![index].tanggalMulai?.day}/${snapshot.data![index].tanggalMulai?.month}/${snapshot.data![index].tanggalMulai?.year} - ${snapshot.data![index].tanggalAkhir?.day}/${snapshot.data![index].tanggalAkhir?.month}/${snapshot.data![index].tanggalAkhir?.year}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                                width: double
                                                                    .infinity,
                                                                child: ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                        "Join this event"))),
                                                          ],
                                                        ),
                                                      ),
                                                    )));
                                          },
                                          child: Text("Read More"))
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ],
                );
              }
            }
          }),
    );
  }
}
