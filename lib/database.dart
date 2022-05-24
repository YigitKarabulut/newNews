import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  final String id;
  final String baslik;
  final String baslik2;
  final String baslik3;
  final String baslik4;
  final String baslik5;
  final String icerik;
  final String icerik4;
  final String icerik5;
  final String icerik6;
  final String icerik7;
  final String icerik8;
  final String icerik9;
  final String icerik10;
  final String icerik11;
  final String icerik12;
  final String icerik13;
  final String icerik14;
  final String icerik15;
  final String icerik16;
  final String icerik17;
  final String icerik18;
  final String icerik19;
  final String icerik20;
  final String icerik21;
  final String icerik22;
  final String icerik23;
  final String icerik24;
  final String icerik25;
  final String kategori;
  final String tarih;
  final String kaynak;
  final String url;
  final String url2;
  final String url3;
  final String url4;
  final String icerik2;
  final String icerik3;
  int viewers;

  DatabaseHelper({
    this.url3,
    this.url4,
    this.baslik5,
    this.icerik7,
    this.icerik8,
    this.icerik9,
    this.icerik10,
    this.icerik11,
    this.icerik12,
    this.icerik13,
    this.icerik14,
    this.icerik15,
    this.icerik16,
    this.icerik17,
    this.icerik18,
    this.icerik19,
    this.icerik20,
    this.icerik21,
    this.icerik22,
    this.icerik23,
    this.icerik24,
    this.icerik25,
    this.url2,
    this.baslik2,
    this.baslik3,
    this.baslik4,
    this.icerik4,
    this.icerik5,
    this.icerik6,
    this.icerik3,
    this.icerik2,
    this.id,
    this.baslik,
    this.icerik,
    this.kategori,
    this.tarih,
    this.kaynak,
    this.url,
    this.viewers,
  });
  factory DatabaseHelper.createDocument(DocumentSnapshot doc) {
    return DatabaseHelper(
      id: doc.id,
      baslik: doc.data()["baslik"],
      baslik2: doc.data()["baslik2"],
      baslik3: doc.data()["baslik3"],
      baslik4: doc.data()["baslik4"],
      baslik5: doc.data()["baslik5"],
      icerik: doc.data()["icerik"],
      icerik2: doc.data()["icerik2"],
      icerik3: doc.data()["icerik3"],
      icerik4: doc.data()["icerik4"],
      icerik5: doc.data()["icerik5"],
      icerik6: doc.data()["icerik6"],
      icerik7: doc.data()["icerik7"],
      icerik8: doc.data()["icerik8"],
      icerik9: doc.data()["icerik9"],
      icerik10: doc.data()["icerik10"],
      icerik11: doc.data()["icerik11"],
      icerik12: doc.data()["icerik12"],
      icerik13: doc.data()["icerik13"],
      icerik14: doc.data()["icerik14"],
      icerik15: doc.data()["icerik15"],
      icerik16: doc.data()["icerik16"],
      icerik17: doc.data()["icerik17"],
      icerik18: doc.data()["icerik18"],
      icerik19: doc.data()["icerik19"],
      icerik20: doc.data()["icerik20"],
      icerik21: doc.data()["icerik21"],
      icerik22: doc.data()["icerik22"],
      icerik23: doc.data()["icerik23"],
      icerik24: doc.data()["icerik24"],
      icerik25: doc.data()["icerik25"],
      kategori: doc.data()["kategori"],
      tarih: doc.data()["tarih"],
      kaynak: doc.data()["kaynak"],
      url: doc.data()["url"],
      url2: doc.data()["url2"],
      url3: doc.data()["url3"],
      url4: doc.data()["url4"],
      viewers: doc.data()["viewers"],
    );
  }
}
