import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:restore_the_shore_flutter/create-event/models/event.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// void createEvent(
//     String namaEvent,
//     String namaPantai,
//     String alamatPantai,
//     int jumlahPartisipan,
//     String fotoPantai,
//     String deskripsi,
//     DateTime tanggalMulai,
//     DateTime tanggalAkhir) async {
//   final response = await http.post(
//     Uri.parse('https://restore-the-shore.up.railway.app/create-event/add/'),
//     body: jsonEncode(<String, String>{
//       "namaEvent": namaEvent.toString(),
//       "namaPantai": namaPantai.toString(),
//       "alamatPantai": alamatPantai.toString(),
//       "jumlahPartisipan": jumlahPartisipan.toString(),
//       "fotoPantai": fotoPantai.toString(),
//       "deskripsi": deskripsi.toString(),
//       "tanggalMulai": tanggalMulai.toString(),
//       "tanggalAkhir": tanggalAkhir.toString(),
//     }),
//   );
//   print(response.statusCode);
// }

Future<EventList?> createEvent(
    CookieRequest request,
    String namaEvent,
    String namaPantai,
    String alamatPantai,
    int jumlahPartisipan,
    String fotoPantai,
    String deskripsi,
    DateTime tanggalMulai,
    DateTime tanggalAkhir) async {
  final response = await request
      .post('https://restore-the-shore.up.railway.app/create-event/add/', {
    "namaEvent": namaEvent,
    "namaPantai": namaPantai,
    "alamatPantai": alamatPantai,
    "jumlahPartisipan": jumlahPartisipan.toString(),
    "fotoPantai": fotoPantai,
    "deskripsi": deskripsi,
    "tanggalMulai": tanggalMulai.toString(),
    "tanggalAkhir": tanggalAkhir.toString(),
  });
  print(response.statusCode);
  return EventList.fromJson(response);
}
