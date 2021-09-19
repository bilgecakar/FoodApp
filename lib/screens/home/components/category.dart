import 'package:flutter/material.dart';
import 'package:food_app/Comps/loading.dart';

import 'package:food_app/models/recipes.dart';
import 'package:food_app/screens/home/components/recipsCard.dart';
import 'package:food_app/screens/recipeDetail/recipe_detail.dart';
import 'package:food_app/size_config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
  final RecipeBundle recipeBundle;

  const Categories({Key key, this.recipeBundle}) : super(key: key);
}

class _CategoriesState extends State<Categories> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Column(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize * 2),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing:
                        SizeConfig.orientation == Orientation.landscape
                            ? SizeConfig.defaultSize * 2
                            : 0,
                    childAspectRatio: 1.65,
                  ),
                  itemCount: recipeBundles.length,
                  itemBuilder: (context, index) => RecipesCard(
                    recipeBundle: recipeBundles[index],
                    press: () {
                      setState(() {
                        loading = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetail(id: index.toString())),
                      );
                    },
                  ),
                ),
              ))
            ],
          );
  }
}
