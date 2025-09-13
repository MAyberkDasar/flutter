import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iller_ilceler/il.dart';
import 'package:iller_ilceler/ilce.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<Il> tumIller = [];

  @override
  void initState() {
    super.initState();
    jsonCozumle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İller ve İlçeleri"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: tumIller.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tumIller[index].isim),
                  Text(tumIller[index].plakaKodu),
                ],
              ),
              leading: Icon(Icons.location_city),
              children: tumIller[index].ilceler.map((ilce) {
                return ListTile(
                  title: Text(ilce.isim),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  void jsonCozumle() async {
    String jsonString =
        await rootBundle.loadString("assets/iller_ilceler.json");
    Map<String, dynamic> dosyaMap = jsonDecode(jsonString);

    for (String plakaKodu in dosyaMap.keys) {
      Map<String, dynamic> ilMap = dosyaMap[plakaKodu];

      String ilAdi = ilMap["name"];
      Map<String, dynamic> ilcelerMap = ilMap["districts"];

      List<Ilce> mevcutIlinIlceleri = [];

      for (String ilceKodu in ilcelerMap.keys) {
        Map<String, dynamic> ilceMap = ilcelerMap[ilceKodu];
        String ilceAdi = ilceMap["name"];

        Ilce ilce = Ilce(ilceAdi);
        mevcutIlinIlceleri.add(ilce);
      }

      Il il = Il(ilAdi, plakaKodu, mevcutIlinIlceleri);
      tumIller.add(il);
    }

    setState(() {});
  }
}
