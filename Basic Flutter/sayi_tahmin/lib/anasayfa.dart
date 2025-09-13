import 'package:flutter/material.dart';
import 'package:sayi_tahmin/tahmin_ekrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anasayfa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sayı Tahmin Oyunu", style: TextStyle(fontSize: 25)),
            Image.asset("images/zar_resim.png"),
            ElevatedButton(
              child: Text("OYUNA BAŞLA"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TahminEkrani()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
