import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates/features/auth/controller/auth_controller.dart';
import 'package:flutter_templates/features/screens/home_page.dart';
import 'package:flutter_templates/features/screens/screen/disasterscreen.dart';
import 'package:flutter_templates/models/user_model.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';

import '../../auth/repository/auth_repository.dart';

class ReportFormScreen extends ConsumerStatefulWidget {
  const ReportFormScreen({super.key});

  @override
  ConsumerState<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends ConsumerState<ReportFormScreen> {
  late final FirebaseAuth auth;
  late final FirebaseFirestore firestore;
  var _latitude;
  var _longitude;
  void initState() {
    super.initState();
  }

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
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

  TextEditingController disasterType = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Disaster Type',
                ),
                controller: disasterType,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Description',
                ),
                controller: description,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                readOnly: true,
                onTap: () {
                  showPlacePicker();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Location'),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50), backgroundColor: Colors.red),
                  onPressed: () {
                    addGeoPoint();
                    Navigator.pushReplacementNamed(context, HomePage.routeName);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<DocumentReference?> addGeoPoint() async {
    GeoPoint point = GeoPoint(_latitude, _longitude);
    return FirebaseFirestore.instance.collection('disaster').add({
      'locationLat': point.latitude,
      'locationLong': point.longitude,
      'description': description.text,
      'disasterType': disasterType.text,
      'phoneNumber':
          ref.watch(authRepositoryProvider).auth.currentUser!.phoneNumber
    });
  }
}
