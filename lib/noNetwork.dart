// ignore_for_file: missing_return

import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:newnews/mainPage.dart';

class NoNetwork extends StatefulWidget {
  const NoNetwork({key}) : super(key: key);

  @override
  _NoNetworkState createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> {
  Future<bool> checkInternet() async {
    var connectivityResult = await DataConnectionChecker().hasConnection;

    if (connectivityResult == true) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => HomaPage()));
      });
    } else {}
  }

  void initTimer() async {
    if (await checkInternet()) {
      Timer(Duration(seconds: 0), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => HomaPage()));
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkInternet(),
        builder: (BuildContext c, snap) {
          if (snap.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "newNews",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontFamily: "Serif",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text("Lütfen internet bağlantınızı kontrol ediniz"),
                  ElevatedButton(
                      child: Text("Tekrar deneyin"),
                      onPressed: () {
                        setState(() {
                          initTimer();
                        });
                      })
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
