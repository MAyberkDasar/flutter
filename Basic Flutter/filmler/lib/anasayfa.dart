import 'package:filmler/detay_sayfasi.dart';
import 'package:filmler/film.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Film>> filmleriYukle() async {
    List<Film> filmListesi = [];

    Film f1 = Film(id: 1, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 160);
    Film f2 = Film(id: 2, ad: "Django", resim: "django.png", fiyat: 100);
    Film f3 = Film(id: 3, ad: "Inception", resim: "inception.png", fiyat: 80);
    Film f4 = Film(
      id: 4,
      ad: "Interstellar",
      resim: "interstellar.png",
      fiyat: 220,
    );
    Film f5 = Film(
      id: 5,
      ad: "The Hateful Eight",
      resim: "thehatefuleight.png",
      fiyat: 60,
    );
    Film f6 = Film(
      id: 6,
      ad: "The Pianist",
      resim: "thepianist.png",
      fiyat: 180,
    );

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmler")),
      body: FutureBuilder(
        future: filmleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Film> filmListesi = snapshot.data!;
            return GridView.builder(
              itemCount: filmListesi.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                Film mevcutFilm = filmListesi[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfasi(film: mevcutFilm),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset("images/${mevcutFilm.resim}"),
                        ),
                        Text(
                          mevcutFilm.ad,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${mevcutFilm.fiyat} TL"),
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
