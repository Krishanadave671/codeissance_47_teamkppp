import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Infoscreen extends StatefulWidget {
  const Infoscreen({Key? key}) : super(key: key);

  @override
  State<Infoscreen> createState() => _InfoscreenState();
}

class _InfoscreenState extends State<Infoscreen> {
  var _latitude;
  var _longitude;
  void initState() {
    super.initState();
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"),
      ),
    );

    print(result.latLng!.latitude.toString());
    print(result.latLng!.longitude.toString());
    print(result.formattedAddress);
    setState(() {
      _latitude = result.latLng!.latitude;
      _longitude = result.latLng!.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListEmail(
              icon: Icon(Icons.phone, color: Colors.green),
              titleword: "Contact Department",
              subtitle: "call immediately department"),
          SizedBox(
            height: 20,
          ),
          ListEmail(
              icon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              titleword: "Email Department",
              subtitle: "Email queries to department"),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50), backgroundColor: Colors.red),
              onPressed: () async {
                showPlacePicker();
                await addGeoPoint();
              },
              child: Text(
                'Help',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ))
        ],
      ),
    );
  }

  Future<DocumentReference?> addGeoPoint() async {
    GeoPoint point = GeoPoint(_latitude, _longitude);
    return FirebaseFirestore.instance
        .collection('disaster')
        .add({'latitude': point.latitude, 'longitude': point.longitude});
  }
}

class ListEmail extends StatelessWidget {
  final Icon icon;
  final String titleword;
  final String subtitle;
  const ListEmail({
    Key? key,
    required this.icon,
    required this.titleword,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          if (titleword == "Contact Department") {
            UrlLauncher.launch("tel://+918104875867");
          } else {
            UrlLauncher.launch("mailto:krishnadave671@gmail.com");
          }
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.amber.shade50),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(width: 1.0, color: Colors.black38))),
                  child: icon,
                ),
                title: Text(
                  titleword,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Text(subtitle, style: TextStyle(color: Colors.black))
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.black, size: 30.0)),
          ),
        ),
      ),
    );
  }
}
