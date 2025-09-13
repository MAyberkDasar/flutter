import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin/sonuc_ekrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  TextEditingController tfController = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yardimMetni = "";
  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tahmin Ekranı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak: $kalanHak", style: TextStyle(fontSize: 25)),
            Text("Yardım: $yardimMetni", style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tahmin",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: Text("TAHMİN ET"),
              onPressed: () {
                setState(() {
                  kalanHak -= 1;
                });
                int tahmin = int.parse(tfController.text);
                if (tahmin == rastgeleSayi) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SonucEkrani(sonuc: true),
                    ),
                  );
                }
                if (tahmin < rastgeleSayi) {
                  setState(() {
                    yardimMetni = "Tahmini Arttır";
                  });
                }
                if (rastgeleSayi < tahmin) {
                  setState(() {
                    yardimMetni = "Tahmini Azalt";
                  });
                }
                if (kalanHak == 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SonucEkrani(sonuc: false),
                    ),
                  );
                }
                tfController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
