import 'package:flutter/material.dart';
import 'package:food_app/models/recipes.dart';
import 'package:food_app/screens/home/components/recipsCard.dart';
import 'package:food_app/screens/recipeDetail/recipe_detail.dart';
import 'package:food_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 4),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  SizeConfig.orientation == Orientation.landscape ? 2 : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: SizeConfig.orientation == Orientation.landscape
                  ? SizeConfig.defaultSize * 2
                  : 0,
              childAspectRatio: 1.65,
            ),
            itemCount: recipeBundles.length,
            itemBuilder: (context, index) => RecipesCard(
              recipeBundle: recipeBundles[index],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeDetail(id: index.toString())),
                );
              },
            ),
          ),
        ))
      ],
    );
  }
}
