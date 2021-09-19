import 'package:flutter/material.dart';
import '../../../size_config.dart';

class MaterialMenu extends StatelessWidget {
  const MaterialMenu({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(left: 50),
        child: Row(
          children: [
            Icon(
              Icons.taxi_alert,
              size: 15,
            ),
            SizedBox(
              width: defaultSize,
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
