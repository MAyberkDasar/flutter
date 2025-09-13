import 'package:expense_tracker/gider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GiderEkleWidget extends StatefulWidget {
  final void Function(Gider gider) giderEkle;

  const GiderEkleWidget({super.key, required this.giderEkle});

  @override
  State<GiderEkleWidget> createState() => _GiderEkleWidgetState();
}

class _GiderEkleWidgetState extends State<GiderEkleWidget> {
  TextEditingController baslikController = TextEditingController();
  TextEditingController fiyatController = TextEditingController();
  DateTime? secilenTarih;
  Kategori seciliKategori = Kategori.Eglence;
  void giderKaydet() {
    double? girilenFiyat = double.tryParse(fiyatController.text);
    bool fiyatHataliMi = (girilenFiyat == null) || (girilenFiyat <= 0);
    if ((baslikController.text.trim().isEmpty) ||
        fiyatHataliMi ||
        secilenTarih == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hatalı Girdi"),
            content: Text(
                "Geçerli bir başlık, fiyat veya tarih girdiğinizden emin olunuz!"),
            actions: [
              TextButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      return;
    }

    widget.giderEkle(
      Gider(
          baslik: baslikController.text,
          fiyat: girilenFiyat,
          tarih: secilenTarih!,
          kategori: seciliKategori),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
      child: Column(
        children: [
          TextField(
            controller: baslikController,
            decoration: InputDecoration(
              label: Text("Başlık"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: fiyatController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(label: Text("Fiyat")),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      secilenTarih == null
                          ? "Tarih seçilmedi"
                          : DateFormat.yMd().format(secilenTarih!),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () async {
                        DateTime? tarih = await showDatePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                          initialDate: DateTime.now(),
                        );
                        setState(() {
                          secilenTarih = tarih;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              DropdownButton(
                items: Kategori.values.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                    child: Text(
                      kategori.name.toUpperCase(),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    seciliKategori = value!;
                  });
                },
                value: seciliKategori,
              ),
              Spacer(),
              TextButton(
                child: Text("İptal Et"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                onPressed: giderKaydet,
                child: Text("Gider Kaydet"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
