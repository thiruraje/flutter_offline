//main.dart
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:network/Connectivity.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage() ,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var projectSnap=["thiru","vicky","nan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Connection"),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child
                  ) {
                  final bool connected =connectivity != ConnectivityResult.none;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      connected ? child :  Center(
                        child: CircularProgressIndicator(),
                    ),
                      // Positioned(
                      //   bottom: 0.0,
                      //   right: 0.0,
                      //   left: 0.0,
                      //   height: 32.0,
                      //   child: AnimatedContainer(
                      //     duration: const Duration(milliseconds: 300),
                      //     color:
                      //         connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                      //     child: connected
                      //         ?  Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget>[
                      //               Text(
                      //                 "OFFLINE",
                      //                 style: TextStyle(color: Colors.white),
                      //               ),
                                    
                      //             ],
                      //           )
                      //         : Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget>[
                      //               Text(
                      //                 "OFFLINE",
                      //                 style: TextStyle(color: Colors.white),
                      //               ),
                      //               SizedBox(
                      //                 width: 8.0,
                      //               ),
                      //               SizedBox(
                      //                 width: 12.0,
                      //                 height: 12.0,
                      //                 child: CircularProgressIndicator(
                      //                   strokeWidth: 2.0,
                      //                   valueColor:
                      //                       AlwaysStoppedAnimation<Color>(
                      //                           Colors.white),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //   ),
                      // ),
                    ],
                  );
                },
                child: Center(
                  child: ListView.builder(
                            itemCount:projectSnap.length ,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 50.0,
                                child: Card(
                                  child: Center(child: Text(projectSnap[index].toString()))
                                  ),
                              );
                            },
                          ),
                ),
              );
            },
          ));
  }
}
