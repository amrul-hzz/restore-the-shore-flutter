// To parse this JSON data, do
//
//     final timeline = timelineFromJson(jsonString);

import 'dart:convert';

List<Timeline> timelineFromJson(String str) =>
    List<Timeline>.from(json.decode(str).map((x) => Timeline.fromJson(x)));

String timelineToJson(List<Timeline> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Timeline {
  Timeline({
    required this.user,
    required this.namaEvent,
    required this.namaPantai,
    required this.alamatPantai,
    required this.jumlahPartisipan,
    required this.fotoPantai,
    required this.deskripsi,
    required this.tanggalMulai,
    required this.tanggalAkhir,
  });

  int? user;
  String namaEvent;
  String namaPantai;
  String alamatPantai;
  int jumlahPartisipan;
  String fotoPantai;
  String deskripsi;
  DateTime tanggalMulai;
  DateTime tanggalAkhir;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        user: json["fields"]["user"],
        namaEvent: json["fields"]["namaEvent"],
        namaPantai: json["fields"]["namaPantai"],
        alamatPantai: json["fields"]["alamatPantai"],
        jumlahPartisipan: json["fields"]["jumlahPartisipan"],
        fotoPantai: json["fields"]["fotoPantai"],
        deskripsi: json["fields"]["deskripsi"],
        tanggalMulai: DateTime.parse(json["fields"]["tanggalMulai"]),
        tanggalAkhir: DateTime.parse(json["fields"]["tanggalAkhir"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
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
      };
}
