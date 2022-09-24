import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  static const routeName = '/notification-screen';
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  List<String> depart = [
    'Fire Department',
    'Medical Department',
    'Police Department',
    'Disaster Department',
    'Disaster Department',
    'Police Department',
  ];
  List<String> img = [
    "assets/images/fire-station.png",
    "assets/images/doctor1.png",
    "assets/images/police-badge.png",
    "assets/images/flood.png",
    "assets/images/flood.png",
    "assets/images/police-badge.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 5, right: 5, left: 10),
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(children: [
                                  ListTile(
                                    leading:
                                        Image(image: AssetImage(img[index])),
                                    title: Text(depart[index]),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          'Last Contacted',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('2022-03-21 16:21:35'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ])));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
