library umkm;

import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'dart:convert' as convert;
import 'dart:math';

import 'package:restore_the_shore_flutter/timeline/util/fetch.dart';

import '../colorpalette.dart';
import 'models/timeline_model.dart';

class TimelineHomePage extends StatefulWidget {
  const TimelineHomePage({super.key});

  @override
  State<TimelineHomePage> createState() => _TimelineHomePageState();
}

class _TimelineHomePageState extends State<TimelineHomePage> {
  Future<List<Timeline>> fetchType = fetchTimeline();
  final _formKey = GlobalKey<FormState>();

  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Timeline"),
      ),
      bottomNavigationBar: NavBar(),
      body: request.loggedIn
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Cari event di daerah...",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                constraints: BoxConstraints(maxHeight: 36),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                              ),
                              onChanged: (String? value) {
                                if (value == "") {
                                  setState(() {
                                    fetchType = fetchTimeline();
                                  });
                                } else {
                                  setState(() {
                                    searchValue = value!;
                                  });
                                }
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  searchValue = value!;
                                });
                              },
                              // Validator sebagai validasi form
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    if (searchValue != "")
                                      fetchType = fetchSearch(searchValue);
                                    else
                                      fetchType = fetchTimeline();
                                  });
                                }
                              },
                              icon: Icon(Icons.search))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: fetchType,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (!snapshot.hasData) {
                              return Column(
                                children: const [
                                  Text(
                                    "There is no data yet :(",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8), fontSize: 20),
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data![index].namaPantai}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "${snapshot.data![index].alamatPantai}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "${snapshot.data![index].tanggalMulai?.day}/${snapshot.data![index].tanggalMulai?.month}/${snapshot.data![index].tanggalMulai?.year} - ${snapshot.data![index].tanggalAkhir?.day}/${snapshot.data![index].tanggalAkhir?.month}/${snapshot.data![index].tanggalAkhir?.year}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
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
                                                              builder: (_) =>
                                                                  AlertDialog(
                                                                      scrollable:
                                                                          true,
                                                                      content:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(5.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Image(
                                                                                  // width: 250,
                                                                                  // height: 250,
                                                                                  image: NetworkImage("${snapshot.data![index].fotoPantai}")),
                                                                              Text(
                                                                                "${snapshot.data![index].namaEvent}",
                                                                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                "${snapshot.data![index].namaPantai}",
                                                                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                "${snapshot.data![index].alamatPantai}",
                                                                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                "${snapshot.data![index].jumlahPartisipan}",
                                                                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                "${snapshot.data![index].deskripsi}",
                                                                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              Text(
                                                                                "${snapshot.data![index].tanggalMulai?.day}/${snapshot.data![index].tanggalMulai?.month}/${snapshot.data![index].tanggalMulai?.year} - ${snapshot.data![index].tanggalAkhir?.day}/${snapshot.data![index].tanggalAkhir?.month}/${snapshot.data![index].tanggalAkhir?.year}",
                                                                                style: const TextStyle(fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              Container(
                                                                                  width: double.infinity,
                                                                                  child: ElevatedButton(
                                                                                      onPressed: () async {
                                                                                        var data = convert.jsonEncode(
                                                                                          <String, String?>{
                                                                                            "namaEvent": snapshot.data![index].namaEvent,
                                                                                            "namaPantai": snapshot.data![index].namaPantai,
                                                                                            "alamatPantai": snapshot.data![index].alamatPantai,
                                                                                            "jumlahPartisipan": snapshot.data![index].jumlahPartisipan.toString(),
                                                                                            "fotoPantai": snapshot.data![index].fotoPantai,
                                                                                            "deskripsi": snapshot.data![index].deskripsi,
                                                                                            "tanggalMulai": "${snapshot.data![index].tanggalMulai?.year}-${snapshot.data![index].tanggalMulai?.month}-${snapshot.data![index].tanggalMulai?.day}",
                                                                                            "tanggalAkhir": "${snapshot.data![index].tanggalAkhir?.year}-${snapshot.data![index].tanggalAkhir?.month}-${snapshot.data![index].tanggalAkhir?.day}",
                                                                                          },
                                                                                        );

                                                                                        final response = await request.postJson("https://restore-the-shore.up.railway.app/timeline/join-flutter/", data);

                                                                                        if (response['status'] == 'success') {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                                            content: Text("Event berhasil diikuti!"),
                                                                                          ));
                                                                                        } else if (response['status'] == 'joined') {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                                            content: Text("Event sudah diikuti!"),
                                                                                          ));
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                                            content: Text("An error occured, please try again."),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      child: Text("Join this event"))),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )));
                                                        },
                                                        child:
                                                            Text("Read More"))
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
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromRGBO(93, 192, 211, 1.0),
                      ColorPalette.secondaryColor.shade800
                    ]),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You need to Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
