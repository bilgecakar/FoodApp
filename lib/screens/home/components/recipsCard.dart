import 'package:flutter/material.dart';
import 'package:food_app/models/recipes.dart';
import '../../../size_config.dart';

class RecipesCard extends StatelessWidget {
  @override
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipesCard({Key key, this.recipeBundle, this.press}) : super(key: key);

  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            color: recipeBundle.color,
            borderRadius: BorderRadius.circular(defaultSize * 1.8)),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    recipeBundle.title,
                    style: TextStyle(
                      fontSize: defaultSize * 2.2,
                      color: (Colors.white),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: defaultSize * 0.5),
                  Text(
                    recipeBundle.description,
                    style: TextStyle(color: Colors.white54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  buildinfoRow(defaultSize,
                      iconSrc: "assets/images/chefff.png",
                      text: recipeBundle.chefs),
                  Spacer()
                ],
              ),
            )),
            SizedBox(
              width: defaultSize * 0.5,
            ),
            AspectRatio(
                aspectRatio: 0.71,
                child: Image.asset(
                  recipeBundle.imageSrc,
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
