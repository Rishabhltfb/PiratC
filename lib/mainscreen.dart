import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  MapType _currentMapType = MapType.normal;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAsset('images/marker.bmp');
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(40.749790, -73.989030);
    LatLng pinPosition1 = LatLng(40.744830, -73.997520);
    LatLng pinPosition2 = LatLng(40.660960, -73.726570);

    String positionOne = "Treasure 1";
    String positionTwo = "Treasure 2";
    String positionThree = "Treasure 3";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);

    return Scaffold(
      backgroundColor: Hexcolor('#F2ECFF'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor('#F2ECFF'),
        automaticallyImplyLeading: false,
        title: Text(
          "Hello" + " " + nameController.text,
          style: TextStyle(fontFamily: 'Gotham', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/home.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GoogleMap(
                      initialCameraPosition: initialLocation,
                      mapType: _currentMapType,
                      myLocationEnabled: true,
                      markers: _markers,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        setState(() {
                          _markers.add(Marker(
                              markerId: MarkerId("Treasure 1"),
                              position: pinPosition,
                              infoWindow: InfoWindow(
                                title: positionOne,
                                snippet: 'Keep finding',
                              ),
                              icon: pinLocationIcon));

                          _markers.add(Marker(
                              markerId: MarkerId("Treasure 2"),
                              position: pinPosition1,
                              infoWindow: InfoWindow(
                                title: positionTwo,
                                snippet: 'Keep finding',
                              ),
                              icon: pinLocationIcon));

                          _markers.add(Marker(
                              markerId: MarkerId("Treasure 3"),
                              position: pinPosition2,
                              infoWindow: InfoWindow(
                                title: positionThree,
                                snippet: 'Keep finding',
                              ),
                              icon: pinLocationIcon));
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Hexcolor('#FFE694'),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/game.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Hint",
                              style:
                                  TextStyle(fontFamily: 'Gotham', fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Look at the map and then use the AR, thy shall you see a treasure",
                              style:
                                  TextStyle(fontFamily: 'Gotham', fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Hexcolor('#FFE8F7'),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/wallpaper.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Team Code",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  fontSize: 20,
                                  color: Hexcolor('#5C6178')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SelectableText(
                              "AVB672A",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  fontSize: 20,
                                  color: Hexcolor('#5C6178')),
                            ),
                          ),
                          Row(
                            children: [],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
