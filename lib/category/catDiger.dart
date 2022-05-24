import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newnews/contents.dart';
import 'package:newnews/database.dart';

class CatDiger extends StatefulWidget {
  const CatDiger({key}) : super(key: key);

  @override
  _CatDigerState createState() => _CatDigerState();
}

class _CatDigerState extends State<CatDiger> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Diğer",
          style: TextStyle(
              fontSize: 26.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection("newNews")
            .where("kategori", isEqualTo: "Diğer")
            .orderBy("id", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<DatabaseHelper> database = snapshot.data.docs
              .map((doc) => DatabaseHelper.createDocument(doc))
              .toList();
          return GridView.builder(
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.8),
            itemCount: database.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  database[index].viewers++;
                  db.collection("newNews").doc(database[index].id).update({
                    "viewers": database[index].viewers,
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Content(
                                baslik: database[index].baslik,
                                baslik2: database[index].baslik2,
                                baslik3: database[index].baslik3,
                                baslik4: database[index].baslik4,
                                baslik5: database[index].baslik5,
                                icerik: database[index].icerik,
                                icerik2: database[index].icerik2,
                                icerik3: database[index].icerik3,
                                icerik4: database[index].icerik4,
                                icerik5: database[index].icerik5,
                                icerik6: database[index].icerik6,
                                icerik7: database[index].icerik7,
                                icerik8: database[index].icerik8,
                                icerik9: database[index].icerik9,
                                icerik10: database[index].icerik10,
                                icerik11: database[index].icerik11,
                                icerik12: database[index].icerik12,
                                icerik13: database[index].icerik13,
                                icerik14: database[index].icerik14,
                                icerik15: database[index].icerik15,
                                icerik16: database[index].icerik16,
                                icerik17: database[index].icerik17,
                                icerik18: database[index].icerik18,
                                icerik19: database[index].icerik19,
                                icerik20: database[index].icerik20,
                                icerik21: database[index].icerik21,
                                icerik22: database[index].icerik22,
                                icerik23: database[index].icerik23,
                                icerik24: database[index].icerik24,
                                icerik25: database[index].icerik25,
                                url: database[index].url,
                                url2: database[index].url2,
                                url3: database[index].url3,
                                url4: database[index].url4,
                                kategori: database[index].kategori,
                                tarih: database[index].tarih,
                                viewers: database[index].viewers.toString(),
                                kaynak: database[index].kaynak,
                              ))).then((value) => setState(() => {}));
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black38, BlendMode.darken),
                          image: NetworkImage(database[index].url),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 22.0,
                      ),
                      Text(
                        database[index].baslik,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.cyan),
                            child: Text(
                              database[index].kategori,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          Text(
                            database[index].tarih,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                          Text(
                            database[index].viewers.toString() +
                                " " +
                                "Görüntülenme",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
