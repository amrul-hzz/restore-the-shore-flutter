import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/create-event/function/fetch_event.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:restore_the_shore_flutter/create-event/pages/event_detail.dart';

class EventDataPage extends StatefulWidget {
  const EventDataPage({Key? key}) : super(key: key);

  @override
  State<EventDataPage> createState() => _EventDataPageState();
}

class _EventDataPageState extends State<EventDataPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event Creation History'),
        ),
        bottomNavigationBar: const NavBar(),
        body: FutureBuilder(
            future: fetchEventList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [Text("Tidak ada event yang ada.")],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                Image.network(
                                    snapshot.data![index].fields.fotoPantai),
                                ListTile(
                                  leading:
                                      const Icon(Icons.beach_access_rounded),
                                  title: Text(
                                    "${snapshot.data![index].fields.namaEvent}",
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${snapshot.data![index].fields.namaPantai}\n${snapshot.data![index].fields.alamatPantai}\n${DateFormat("MMM dd, y").format(snapshot.data![index].fields.tanggalMulai)} - ${DateFormat("MMM dd, y").format(snapshot.data![index].fields.tanggalAkhir)}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EventDetailPage(
                                                    data: snapshot
                                                        .data![index].fields,
                                                    datapk: snapshot
                                                        .data![index].pk,
                                                  )),
                                        );
                                      },
                                      child: const Text('More Info',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
