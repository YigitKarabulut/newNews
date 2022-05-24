import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'package:flutter/material.dart';
import 'package:newnews/articles.dart';
import 'package:newnews/category/categories.dart';

import 'package:newnews/trend.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({Key key}) : super(key: key);

  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  bool isSearching = false;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Ana sayfa", Colors.cyan),
    new TabItem(Icons.list, "Kategoriler", Colors.cyan),
    new TabItem(Icons.whatshot, "Popüler", Colors.cyan),
  ]);
  int seciliPozisyon = 0;
  CircularBottomNavigationController _navigationController;

  List<Widget> _articlesTitle;
  @override
  void initState() {
    super.initState();

    _articlesTitle = [
      Articles(),
      Categories(),
      Trends(),
    ];
    _navigationController =
        new CircularBottomNavigationController(seciliPozisyon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "newNews",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Serif",
                  color: Colors.white),
            ),
            Text(
              seciliPozisyon == 0
                  ? "Birbirinden ilginç içerikler"
                  : seciliPozisyon == 1
                      ? "Kategoriler"
                      : "Popüler içerikler",
              style: TextStyle(fontSize: 12.0, color: Colors.white70),
            ),
          ],
        ),
        elevation: 0.5,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        barHeight: 50.0,
        barBackgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        selectedCallback: (int selectedPos) {
          setState(() {
            seciliPozisyon = selectedPos;
          });
        },
      ),
      body: _articlesTitle[seciliPozisyon],
    );
  }
}
