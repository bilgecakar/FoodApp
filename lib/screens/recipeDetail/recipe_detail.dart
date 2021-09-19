import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Comps/my_bottom_nav.dart';
import 'package:food_app/screens/recipeDetail/Components/materialmenu.dart';
import '../../size_config.dart';
import 'Components/recipe_menu.dart';

class RecipeDetail extends StatefulWidget {
  String id;
  RecipeDetail({this.id});
  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference recipes = _firestore.collection('Recipe');
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo6.png',
            width: 200,
            height: 120,
          ),
          actions: <Widget>[
            SizedBox(
              width: SizeConfig.defaultSize * 0.5,
            )
          ]),
      body: FutureBuilder<DocumentSnapshot>(
          future: recipes.doc(widget.id).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            Map<String, dynamic> data = snapshot.data.data();
            return SingleChildScrollView(
                child: Column(
              children: [
                Image.network(data.cast()['image']),
                Container(
                  child: Column(
                    children: [
                      RecipeMenu(
                        iconSrc: "assets/images/cooking.png",
                        title: data['name'],
                      ),
                      RecipeMenu(
                        iconSrc: "assets/images/clock.png",
                        title: data['time'],
                      ),
                      RecipeMenu(
                        iconSrc: "assets/images/chef.png",
                        title: data['chef'],
                      ),
                      RecipeMenu(
                        iconSrc: "assets/images/bake.png",
                        title: "Food Materials",
                      ),
                      MaterialMenu(
                        title: data['ingredient1'],
                      ),
                      MaterialMenu(
                        title: data['ingredient2'],
                      ),
                      MaterialMenu(
                        title: data['ingredient3'],
                      ),
                      MaterialMenu(
                        title: data['ingredient4'],
                      ),
                      MaterialMenu(
                        title: data['ingredient5'],
                      ),
                      MaterialMenu(
                        title: data['ingredient6'],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          data['description'],
                          style: TextStyle(
                            fontSize: SizeConfig.defaultSize * 1.6,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          }),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
