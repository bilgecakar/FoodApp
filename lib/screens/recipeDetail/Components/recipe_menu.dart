import 'package:flutter/material.dart';
import '../../../size_config.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({
    Key key,
    this.iconSrc,
    this.title,
  }) : super(key: key);

  final String iconSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 0.9),
        child: Row(
          children: [
            Image.asset(iconSrc),
            SizedBox(
              width: defaultSize * 2,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: defaultSize * 1.6,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
