import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  final bool sonuc;
  const SonucEkrani({required this.sonuc, super.key});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sonuç Ekranı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc
                ? Image.asset("images/mutlu_resim.png")
                : Image.asset("images/uzgun_resim.png"),
            widget.sonuc
                ? Text("Kazandınız", style: TextStyle(fontSize: 25))
                : Text("Kaybettiniz", style: TextStyle(fontSize: 25)),
            ElevatedButton(
              child: Text("TEKRAR DENE"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
