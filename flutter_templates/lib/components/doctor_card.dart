import 'package:flutter/material.dart';
import 'package:flutter_templates/common/utils/colors.dart';
import 'package:flutter_templates/features/screens/home_page.dart';
import 'package:flutter_templates/features/screens/screen/disasterscreen.dart';

class DoctorCard extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;

  DoctorCard(this._name, this._description, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisasterScreen(
              
            ),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(_imageUrl),
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
