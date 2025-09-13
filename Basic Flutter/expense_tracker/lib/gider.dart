import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

enum Kategori {
  Yiyecek,
  Seyahat,
  Eglence,
}

const kategoriIkonlari = {
  Kategori.Yiyecek: Icons.lunch_dining,
  Kategori.Seyahat: Icons.flight_takeoff,
  Kategori.Eglence: Icons.movie,
};

class Gider {
  final String id;
  final String baslik;
  final double fiyat;
  final DateTime tarih;
  final Kategori kategori;

  Gider({
    required this.baslik,
    required this.fiyat,
    required this.tarih,
    required this.kategori,
  }) : id = uuid.v4();

  String get formatlanmisTarihiGetir {
    return DateFormat.yMd().format(tarih);
  }
}
