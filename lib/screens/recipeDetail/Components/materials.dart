import 'package:flutter/material.dart';
import '../../../colors.dart';
import '../../../size_config.dart';

class Materials extends StatefulWidget {
  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  List<String> materials = [
    "Olivie Oil",
    "Onion",
    "Garlic",
    "Tomato",
    "Waterrrr",
    "Olivie Oilrrr",
    "Onionrrr",
    "Garlrrric",
    "Tomato",
    "Water",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 100,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: materials.length,
            itemBuilder: (context, index) => buildMaterials(index)));
  }

  Widget buildMaterials(int index) => Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize * 0.5,
            vertical: SizeConfig.defaultSize * 0.5),
        decoration: BoxDecoration(
            color: Color(0xFFEFF3EE),
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.6)),
        child: Text(
          materials[index],
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          textAlign: TextAlign.center,
        ),
      );
}
