import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:intl/intl.dart';

class EventDetailPage extends StatefulWidget {
  EventDetailPage({super.key, this.data, this.datapk});
  var data;
  var datapk;
  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      bottomNavigationBar: const NavBar(),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(30.0),
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 10),
            //Nama Event
            Center(
                child: Text(
              '${widget.data.namaEvent}',
              style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 25),
            //Beach Name
            RichText(
              text: TextSpan(
                text: 'Beach Name: ',
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '${widget.data.namaPantai}',
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Alamat Pantai
            RichText(
              text: TextSpan(
                text: 'Beach Address: ',
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '${widget.data.alamatPantai}',
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Number of Participants
            RichText(
              text: TextSpan(
                text: 'Number of Participants: ',
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '${widget.data.jumlahPartisipan}',
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Start Date
            RichText(
              text: TextSpan(
                text: 'Start Date: ',
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: DateFormat("MMM dd, y")
                        .format(widget.data.tanggalMulai),
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //End Date
            RichText(
              text: TextSpan(
                text: 'End Date: ',
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: DateFormat("MMM dd, y")
                        .format(widget.data.tanggalAkhir),
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Description
            RichText(
              text: TextSpan(
                text: 'Description: ',
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '${widget.data.deskripsi}',
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Beach Photo: ',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Image.network(widget.data.fotoPantai),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'event-data');
                var pk = widget.datapk;
                await request.post(
                    "https://restore-the-shore.up.railway.app/create-event/delete-event/$pk/",
                    {});
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
