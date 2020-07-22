import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(10.7915178, 106.7271422),
                  zoom: 14.4746,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Text(
                        "Taxi App",
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: FlatButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(Icons.menu),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
