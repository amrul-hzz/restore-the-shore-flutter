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
            future: request.get(
                "https://restore-the-shore.up.railway.app/timeline/json/"),
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 2.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data[index]["fields"]["namaEvent"]} @${snapshot.data[index]["fields"]["namaPantai"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Image(
                              image: NetworkImage(
                                  "${snapshot.data![index]["fields"]["fotoPantai"]}")),
                          const SizedBox(
                            height: 16,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                const WidgetSpan(
                                    child: Icon(
                                  Icons.my_location_outlined,
                                  size: 18,
                                )),
                                const WidgetSpan(child: SizedBox(width: 6)),
                                TextSpan(
                                  text:
                                      "${snapshot.data[index]["fields"]["alamatPantai"]}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "${snapshot.data[index]["fields"]["tanggalMulai"].toString().substring(0, 10)}  -  ${snapshot.data[index]["fields"]["tanggalAkhir"].toString().substring(0, 10)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
