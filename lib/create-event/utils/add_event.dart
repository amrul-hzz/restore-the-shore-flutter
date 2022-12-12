import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:restore_the_shore_flutter/create-event/models/event.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
  final response = await request.post(
    'https://restore-the-shore.up.railway.app/create-event/add/',
    jsonEncode(<String, dynamic>{
      "user": 1,
      "namaEvent": namaEvent,
      "namaPantai": namaPantai,
      "alamatPantai": alamatPantai,
      "jumlahPartisipan": jumlahPartisipan,
      "fotoPantai": fotoPantai,
      "deskripsi": deskripsi,
      "tanggalMulai":
          "${tanggalMulai.year.toString().padLeft(4, '0')}-${tanggalMulai.month.toString().padLeft(2, '0')}-${tanggalMulai.day.toString().padLeft(2, '0')}",
      "tanggalAkhir":
          "${tanggalAkhir.year.toString().padLeft(4, '0')}-${tanggalAkhir.month.toString().padLeft(2, '0')}-${tanggalAkhir.day.toString().padLeft(2, '0')}",
    }),
  );
  print(response.statusCode);
  return EventList.fromJson(response);
}
