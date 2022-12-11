import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/create-event/utils/add_event.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      bottomNavigationBar:
          const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
      appBar: AppBar(
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
      ),
      body: ListView(
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
                          return 'Nominal budget wajib diisi!';
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
                            ? 'Belum ada tanggal yang dipilih'
                            : tanggalMulai.toString()),
                      ],
                    ),
                  ),
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
                            ? 'Belum ada tanggal yang dipilih'
                            : tanggalAkhir.toString()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Beach Photo (Copy Your Beach Photo URL",
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
                        return null;
                      },
                    ),
                  ),
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
                  if (_formKey.currentState!.validate()) {
                    final response = await request.post(
                        'https://restore-the-shore.up.railway.app/create-event/add/',
                        {
                          'namaEvent': _namaEvent,
                          'namaPantai': _namaPantai,
                          'alamatPantai': _alamatPantai,
                          'jumlahPartisipan': _jumlahPartisipan.toString(),
                          'fotoPantai': _fotoPantai,
                          'deskripsi': _deskripsi,
                          'tanggalMulai': tanggalMulai.toString(),
                          'tanggalAkhir': tanggalAkhir.toString(),
                        }).then((value) => print("berhasil"));
                  }
                  //print("berhasil");
                  // if (_formKey.currentState!.validate()) {
                  //   createEvent(
                  //       request,
                  //       _namaEvent,
                  //       _namaPantai,
                  //       _alamatPantai,
                  //       _jumlahPartisipan,
                  //       _fotoPantai,
                  //       _deskripsi,
                  //       tanggalMulai!,
                  //       tanggalAkhir!);
                  // }

                  //print(response.statusCode);
                  // createEvent(
                  //     _namaEvent,
                  //     _namaPantai,
                  //     _alamatPantai,
                  //     _jumlahPartisipan,
                  //     _fotoPantai,
                  //     _deskripsi,
                  //     tanggalMulai!,
                  //     tanggalAkhir!);
                  // if (_formKey.currentState!.validate()) {
                  //   final response = http.post(
                  //     Uri.parse(
                  //         'https://restore-the-shore.up.railway.app/create-event/add/'),
                  //     body: jsonEncode(<String, String>{
                  //       "namaEvent": _namaEvent,
                  //       "namaPantai": _namaPantai,
                  //       "alamatPantai": _alamatPantai,
                  //       "jumlahPartisipan": _jumlahPartisipan.toString(),
                  //       "fotoPantai": _fotoPantai,
                  //       "deskripsi": _deskripsi,
                  //       "tanggalMulai": tanggalMulai.toString(),
                  //       "tanggalAkhir": tanggalAkhir.toString(),
                  //     }),
                  //   );

                  //   print(response.statusCode);

                  //print("michaelllllll");
                  // var map = new Map<String, String>();
                  // map['namaEvent'] = _namaEvent;
                  // map['namaPantai'] = _namaPantai;
                  // map['alamatPantai'] = _alamatPantai;
                  // map['jumlahPartisipan'] = _jumlahPartisipan.toString();
                  // map['fotoPantai'] = _fotoPantai;
                  // map['deskripsi'] = _deskripsi;
                  // map['tanggalMulai'] = tanggalMulai.toString();
                  // map['tanggalAkhir'] = tanggalAkhir.toString();
                  // final response = await request.post(
                  //     "https://restore-the-shore.up.railway.app/create-event/add/",
                  //     {
                  //       "namaEvent": _namaEvent,
                  //       "namaPantai": _namaPantai,
                  //       "alamatPantai": _alamatPantai,
                  //       "jumlahPartisipan": _jumlahPartisipan.toString(),
                  //       "fotoPantai": _fotoPantai,
                  //       "deskripsi": _deskripsi,
                  //       "tanggalMulai": tanggalMulai.toString(),
                  //       "tanggalAkhir": tanggalAkhir.toString(),
                  //     });
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return Dialog(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       elevation: 15,
                  //       child: Container(
                  //         child: ListView(
                  //           padding: const EdgeInsets.all(20.0),
                  //           shrinkWrap: true,
                  //           children: <Widget>[
                  //             Center(child: const Text('Informasi Data')),
                  //             SizedBox(height: 20),
                  //             Text('Judul : $_namaPantai'),
                  //             Text('Nominal : $_namaEvent'),
                  //             Text('Jenis : $_alamatPantai'),
                  //             Text('Judul : $_jumlahPartisipan'),
                  //             Text('Nominal : $_fotoPantai'),
                  //             Text('Jenis : $_deskripsi'),
                  //             Text('Jenis : $tanggalMulai'),
                  //             Text('Jenis : $tanggalAkhir'),
                  //             TextButton(
                  //               onPressed: () {
                  //                 Navigator.pop(context);
                  //               },
                  //               child: const Text('Kembali'),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                  // setBudget(_judul, _nominal, jenis!, tanggal!);
                  //}
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
