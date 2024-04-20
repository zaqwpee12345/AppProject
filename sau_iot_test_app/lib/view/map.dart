import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sau_iot_test_app/model/nodemcu_write.dart';
import 'package:sau_iot_test_app/service/call_api_data_nodemcu.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Future<List<Nodemcu_write>>? nodemcuList;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getLocation();
    getCallApiGetAll();
  }

  getCallApiGetAll() {
    setState(() {
      nodemcuList = callAPIdatanodemcu.getallAPI();
      print('xxxxxxxxxxxxx : ${nodemcuList}');
    });
  }

  void getLocation() async {
    Location location = Location();
    var _locationData = await location.getLocation();
    print(_locationData);

    // Clear previous markers
    _markers.clear();

    // Add a marker for the user's current location
    _markers.add(
      Marker(
        markerId: MarkerId("userLocation"),
        position: LatLng(_locationData.latitude!, _locationData.longitude!),
        infoWindow: InfoWindow(
          title: "Your Location",
        ),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        title: Text(
          'GPS',
          style: GoogleFonts.lemon(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          children: [
             GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                  23.63,
                   56.89,
                  ),
                  zoom: 14.4746,
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {},
              ),
            FutureBuilder(
              future: nodemcuList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children: [
                      Text("latitude : ${snapshot.data[0].latitude}"),
                      Text("longtitude : ${snapshot.data[0].latitude}"),
                  //      GoogleMap(
                  //   myLocationButtonEnabled: true,
                  //   myLocationEnabled: true,
                  //   mapType: MapType.hybrid,
                  //   initialCameraPosition: CameraPosition(
                  //     target: LatLng(
                  //      12.67, //double
                  //      12.67, //double
                  //     ),
                  //     zoom: 14.4746,
                  //   ),
                  //   markers: _markers,
                  //   onMapCreated: (GoogleMapController controller) {},
                  // ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('มีข้อผิดพลาด กรุณาโหลดใหม่'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
