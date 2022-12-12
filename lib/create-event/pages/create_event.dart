import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:core';
import 'package:restore_the_shore_flutter/colorpalette.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaEvent = "";
  String _namaPantai = "";
  String _alamatPantai = "";
  int _jumlahPartisipan = 0;
  String _fotoPantai = "";
  String _deskripsi = "";
  DateTime? tanggalMulai;
  DateTime? tanggalAkhir;

  bool isNumeric(String value) {
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      bottomNavigationBar:
          const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
      appBar: ((request.loggedIn) &&
              (request.jsonData['type'].toString() == "[admin]"))
          ? AppBar(
              title: const Text('Add New Event'),
              actions: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'event-data');
                  },
                  icon: const Icon(
                    Icons.history_outlined,
                  ),
                  label: const Text('History'),
                ),
              ],
            )
          : null,
      body: ((request.loggedIn) &&
              (request.jsonData['type'].toString() == "[admin]"))
          ? ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Event Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _namaEvent = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _namaEvent = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama event wajib diisi!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Beach Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _namaPantai = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _namaPantai = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama pantai wajib diisi!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Beach Address",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _alamatPantai = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _alamatPantai = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Alamat pantai wajib diisi!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Number of Participants",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _jumlahPartisipan = int.parse(value!);
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _jumlahPartisipan = int.parse(value!);
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nomor partisipan wajib diisi!';
                              }
                              if (!isNumeric(value)) {
                                return 'Nomor partisipan harus berupa angka!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text("Start Date"),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2099),
                                  ).then((startDate) {
                                    setState(() {
                                      tanggalMulai = startDate!;
                                    });
                                  });
                                },
                              ),
                              Text(tanggalMulai == null
                                  ? 'Tanggal mulai wajib dipilih!'
                                  : "${tanggalMulai!.year.toString().padLeft(4, '0')}-${tanggalMulai!.month.toString().padLeft(2, '0')}-${tanggalMulai!.day.toString().padLeft(2, '0')}"),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text("End Date"),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2099),
                                  ).then((endDate) {
                                    setState(() {
                                      tanggalAkhir = endDate!;
                                    });
                                  });
                                },
                              ),
                              Text(tanggalAkhir == null
                                  ? 'Tanggal akhir wajib dipilih!'
                                  : "${tanggalAkhir!.year.toString().padLeft(4, '0')}-${tanggalAkhir!.month.toString().padLeft(2, '0')}-${tanggalAkhir!.day.toString().padLeft(2, '0')}"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText:
                                  "Beach Photo (Copy Your Beach Photo URL",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _fotoPantai = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _fotoPantai = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Foto pantai wajib diisi!';
                              }
                              Uri uri;
                              try {
                                uri = Uri.parse(value);
                              } catch (error) {
                                return 'URL tidak valid';
                              }
                              if (!(uri.isAbsolute)) return 'URL tidak valid';
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.network(
                          _fotoPantai,
                          width: 300,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _deskripsi = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _deskripsi = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Deskripsi wajib diisi!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () async {
                        if (tanggalAkhir != null || tanggalAkhir != null) {
                          if (_formKey.currentState!.validate()) {
                            final response = await request.post(
                                'https://restore-the-shore.up.railway.app/create-event/add-mobile/',
                                {
                                  "username": request.jsonData['username'],
                                  "namaEvent": _namaEvent,
                                  "namaPantai": _namaPantai,
                                  "alamatPantai": _alamatPantai,
                                  "jumlahPartisipan":
                                      _jumlahPartisipan.toString(),
                                  "fotoPantai": _fotoPantai,
                                  "deskripsi": _deskripsi,
                                  "tanggalMulai":
                                      "${tanggalMulai!.year.toString().padLeft(4, '0')}-${tanggalMulai!.month.toString().padLeft(2, '0')}-${tanggalMulai!.day.toString().padLeft(2, '0')}",
                                  "tanggalAkhir":
                                      "${tanggalAkhir!.year.toString().padLeft(4, '0')}-${tanggalAkhir!.month.toString().padLeft(2, '0')}-${tanggalAkhir!.day.toString().padLeft(2, '0')}",
                                });
                          }
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Container(
                                  child: ListView(
                                    padding: const EdgeInsets.all(10.0),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const SizedBox(height: 10),
                                      const Center(
                                          child: const Text(
                                              'Event successfully created!',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacementNamed(
                                              context, 'create-event');
                                        },
                                        child: const Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Container(
                                  child: ListView(
                                    padding: const EdgeInsets.all(10.0),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const SizedBox(height: 10),
                                      const Center(
                                          child: const Text(
                                              'Periksa kembali input anda!',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Create Event",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
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
