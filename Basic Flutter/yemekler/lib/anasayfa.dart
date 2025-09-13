import 'package:flutter/material.dart';
import 'package:yemekler/detay_sayfasi.dart';
import 'package:yemekler/yemek.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Yemek>> yemekleriYukle() async {
    List<Yemek> yemekListesi = [];

    Yemek y1 = Yemek(id: 1, ad: "Köfte", resim: "kofte.png", fiyat: 200);
    Yemek y2 = Yemek(id: 2, ad: "Ayran", resim: "ayran.png", fiyat: 20);
    Yemek y3 = Yemek(id: 3, ad: "Fanta", resim: "fanta.png", fiyat: 40);
    Yemek y4 = Yemek(id: 4, ad: "Makarna", resim: "makarna.png", fiyat: 175);
    Yemek y5 = Yemek(id: 5, ad: "Kadayıf", resim: "kadayif.png", fiyat: 100);
    Yemek y6 = Yemek(id: 6, ad: "Baklava", resim: "baklava.png", fiyat: 125);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yemekler")),
      body: FutureBuilder(
        future: yemekleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Yemek> yemekListesi = snapshot.data!;
            return ListView.builder(
              itemCount: yemekListesi.length,
              itemBuilder: (context, index) {
                Yemek mevcutYemek = yemekListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfasi(yemek: mevcutYemek),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset("images/${mevcutYemek.resim}"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mevcutYemek.ad,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "${mevcutYemek.fiyat.toString()} TL",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
