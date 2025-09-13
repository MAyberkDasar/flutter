import 'package:expense_tracker/gider.dart';
import 'package:expense_tracker/gider_ekle_widget.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<Gider> giderlerListesi = [];

  void giderEklemeSayfasiniAc() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return GiderEkleWidget(
          giderEkle: giderEkle,
        );
      },
    );
  }

  void giderEkle(Gider gider) {
    setState(() {
      giderlerListesi.add(gider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gider Takibi"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: giderEklemeSayfasiniAc,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: giderlerListesi.length,
              itemBuilder: (context, index) {
                Gider mevcutGider = giderlerListesi[index];
                return Dismissible(
                  key: ValueKey(mevcutGider),
                  onDismissed: (direction) {
                    setState(() {
                      giderlerListesi.remove(mevcutGider);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text("Gider silindi"),
                        action: SnackBarAction(
                          label: "Geri Al",
                          onPressed: () {
                            setState(() {
                              giderlerListesi.insert(index, mevcutGider);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mevcutGider.baslik),
                            Row(
                              children: [
                                Text(
                                  "${mevcutGider.fiyat.toStringAsFixed(2)} TL",
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(
                                        kategoriIkonlari[mevcutGider.kategori]),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(mevcutGider.formatlanmisTarihiGetir),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
