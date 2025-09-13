import 'package:filmler/film.dart';
import 'package:flutter/material.dart';

class DetaySayfasi extends StatefulWidget {
  final Film film;
  const DetaySayfasi({required this.film, super.key});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.film.ad)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.film.resim}"),
            Text("${widget.film.fiyat} TL", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
