import 'package:flutter/material.dart';
import 'package:yemekler/yemek.dart';

class DetaySayfasi extends StatelessWidget {
  final Yemek yemek;
  const DetaySayfasi({super.key, required this.yemek});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${yemek.resim}"),
            Text(
              "${yemek.fiyat.toString()} TL",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              child: Text("SİPARİŞ VER"),
              onPressed: () {
                print("${yemek.ad} sipariş verildi");
              },
            ),
          ],
        ),
      ),
    );
  }
}
