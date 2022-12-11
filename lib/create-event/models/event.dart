// To parse this JSON data, do
//
//     final eventList = eventListFromJson(jsonString);

import 'dart:convert';

List<EventList> eventListFromJson(String str) =>
    List<EventList>.from(json.decode(str).map((x) => EventList.fromJson(x)));

String eventListToJson(List<EventList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventList {
  EventList({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
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

  int user;
  String namaEvent;
  String namaPantai;
  String alamatPantai;
  int jumlahPartisipan;
  String fotoPantai;
  String deskripsi;
  DateTime tanggalMulai;
  DateTime tanggalAkhir;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        namaEvent: json["namaEvent"],
        namaPantai: json["namaPantai"],
        alamatPantai: json["alamatPantai"],
        jumlahPartisipan: json["jumlahPartisipan"],
        fotoPantai: json["fotoPantai"],
        deskripsi: json["deskripsi"],
        tanggalMulai: DateTime.parse(json["tanggalMulai"]),
        tanggalAkhir: DateTime.parse(json["tanggalAkhir"]),
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
