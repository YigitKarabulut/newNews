import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

import 'package:newnews/mainPage.dart';
import 'package:newnews/noNetwork.dart';

class ConnectivityService {
  //
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();
  // Stream is like a pipe, you add the changes to the pipe, it will come
  // out on the other side.
  // Create the Constructor

  ConnectivityService() {
    // Subscribe to the connectivity changed stream

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);
    });
  }
}

class ConnectivityDemo extends StatefulWidget {
  ConnectivityDemo() : super();

  @override
  ConnectivityDemoState createState() => ConnectivityDemoState();
}

class ConnectivityDemoState extends State<ConnectivityDemo> {
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  // ignore: missing_return
  Future<bool> checkInternet() async {
    var connectivityResult = await DataConnectionChecker().hasConnection;

    if (connectivityResult == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (contex) => HomaPage()));
    } else if (connectivityResult == false) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => NoNetwork()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
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
                            fontWeight: FontWeight.bold,
                            fontFamily: "Serif",
                            color: Theme.of(context).primaryColor),
                      ),
                      Text("Birbirinden ilginç içerikler",
                          style:
                              TextStyle(fontSize: 21.0, color: Colors.black54))
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "newNews",
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Serif",
                            color: Theme.of(context).primaryColor),
                      ),
                      Text("Birbirinden ilginç içerikler",
                          style:
                              TextStyle(fontSize: 21.0, color: Colors.black54))
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
