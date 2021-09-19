import 'package:flutter/material.dart';
import '../../../colors.dart';
import '../../../size_config.dart';

class ProfilMenuItem extends StatelessWidget {
  const ProfilMenuItem({
    Key key,
    this.iconSrc,
    this.title,
    this.press,
  }) : super(key: key);

  final Widget iconSrc;
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3),
        child: Row(
          children: [
            iconSrc,
            SizedBox(
              width: defaultSize * 2,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: defaultSize * 1.6,
                color: textLigntColor,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: defaultSize * 1.6,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
