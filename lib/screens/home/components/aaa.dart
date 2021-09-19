import 'dart:math';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class AAA extends StatelessWidget {
  @override
  final Function press;
  final String name;
  final String imageUrl;
  final String cheff;
  final String time;
  final String color;

  const AAA(
      {Key key,
      this.press,
      this.name,
      this.imageUrl,
      this.cheff,
      this.time,
      this.color})
      : super(key: key);

  Widget build(BuildContext context) {
    final rand = new Random();
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            color: Color(int.parse(color)),
            borderRadius: BorderRadius.circular(defaultSize * 1.8)),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: defaultSize * 2.2,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: defaultSize * 0.5),
                  Text(
                    time,
                    style: TextStyle(color: Colors.white54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  buildinfoRow(defaultSize,
                      iconSrc: "assets/images/chefff.png", text: cheff),
                  Spacer()
                ],
              ),
            )),
            SizedBox(
              width: defaultSize * 0.5,
            ),
            AspectRatio(
                aspectRatio: 0.71,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ))
          ],
        ),
      ),
    );
  }

  Row buildinfoRow(double defaultSize, {String iconSrc, text}) {
    return Row(
      children: [
        Image.asset(iconSrc),
        SizedBox(
          width: defaultSize,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
