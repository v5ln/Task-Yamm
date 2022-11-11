// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_map_location_picker_flutter/src/address_result.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../helpers.dart/mapHelper.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  AddressResult? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(190, 109, 205, 1),
        title: Text(
          'Location',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 254, 137, 136),
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20),
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(231, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(123, 127, 0, 149),
                        blurRadius: 10,
                        offset: Offset(0, 9), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: address == null
                    ? Text(
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 145, 145, 145)),
                        "click on the button to pick")
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          textAlign: TextAlign.center,
                          (address?.address).toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )),
            ElevatedButton(
                onPressed: () => pickup(),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    backgroundColor: Color.fromARGB(255, 255, 197, 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    "pick location"))
          ],
        ),
      ),
    );
  }

  pickup() async {
    AddressResult result = await showGoogleMapLocationPicker(
      pinWidget: Icon(
        Icons.location_pin,
        color: Color.fromARGB(255, 255, 197, 6),
        size: 55,
      ),
      pinColor: Color.fromARGB(255, 151, 11, 176),
      context: context,
      addressPlaceHolder: "Move the map",
      addressTitle: "The Location",
      apiKey: "AIzaSyAr4Li757gJaWFer2o3nKGmk2zPl9MqVos",
      appBarTitle: "Pick up the location",
      confirmButtonColor: Color.fromARGB(255, 151, 11, 176),
      confirmButtonText: "Confirm location",
      confirmButtonTextColor: Colors.white,
      country: "sa",
      language: "en",
      searchHint: "Search for place",
      initialLocation: LatLng(26.313589, 50.206001),
    );
    if (result != null) {
      setState(() {
        address = result;
      });
    }
  }
}
