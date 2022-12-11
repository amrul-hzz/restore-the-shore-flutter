import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({super.key});

  @override
  State<MyEventPage> createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Events History'),
        ),
        body: FutureBuilder(
            future: request.get("https://restore-the-shore.up.railway.app/timeline/json/"),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: [
                      const Text(
                        "You haven't joined any events :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Join event"),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: Padding(padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data[index]["fields"]["namaEvent"]} @${snapshot.data[index]["fields"]["namaPantai"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "${snapshot.data[index]["fields"]["tanggalMulai"].toString().substring(0, 10)}  -  ${snapshot.data[index]["fields"]["tanggalAkhir"].toString().substring(0, 10)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
