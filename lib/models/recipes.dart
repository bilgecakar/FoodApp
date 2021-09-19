import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, recipes;
  final String title, chefs, description, imageSrc;
  final Color color;

  RecipeBundle(
      {this.id,
      this.chefs,
      this.recipes,
      this.title,
      this.description,
      this.imageSrc,
      this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: "Diana McWoy",
    recipes: 95,
    title: "Healthy Oatmeal with Fruit and Nuts",
    description: "15 Minutes",
    imageSrc: "assets/images/oat.png",
    color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    chefs: "Lei Wyatt",
    recipes: 26,
    title: "Chinese Lion's Head Soup",
    description: "75 Minutes",
    imageSrc: "assets/images/soup.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: "Dawn Fronius",
    recipes: 43,
    title: "Italian Baked Meatballs",
    description: "60 Minutes",
    imageSrc: "assets/images/koftee.png",
    color: Color(0xFF2DBBD8),
  ),
  RecipeBundle(
    id: 4,
    chefs: "Nicolas Jammet",
    recipes: 43,
    title: "Roasted Brussels Sprouts with Cabbage and Pine Nuts",
    description: "40 Minutes",
    imageSrc: "assets/images/sprout.png",
    color: Colors.pink[300],
  ),
];
