import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityPage extends StatefulWidget {
  ConnectivityPage({Key key}) : super(key: key);

  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
 Future<bool> check() async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          return true;
        } else if (connectivityResult == ConnectivityResult.wifi) {
          return true;
        }
        return false;
      }
 
 getProjectDetails() async {
    var result = ["thiru","vicky"];
    return result;    
  }
  @override
  Widget build(BuildContext context) {
    
return FutureBuilder(
      // future: getProjectDetails(),
      builder: (context, snapshot) {
          check().then((intenet) {
            print(intenet);
            return Text(intenet.toString());
            // if (intenet != null && intenet) {
            //   // Internet Present Case
            // }
            // No-Internet Case
          });
        
       
         },
      );
  }
}