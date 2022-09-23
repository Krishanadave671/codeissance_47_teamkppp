import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher_string.dart';

class Infoscreen extends StatelessWidget {
  const Infoscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListEmail(
              icon: Icon(Icons.phone, color: Colors.green),
              titleword: "Contact Department",
              subtitle: "call immediately department"),
          ListEmail(
              icon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              titleword: "Email Department",
              subtitle: "Email queries to department"),
        ],
      ),
    );
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

                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

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
