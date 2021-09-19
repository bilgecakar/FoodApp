import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Comps/loading.dart';
import 'package:food_app/Comps/my_bottom_nav.dart';
import 'package:food_app/net/service.dart';
import 'package:food_app/screens/home/components/aaa.dart';
import 'package:food_app/screens/recipeDetail/recipe_detail.dart';

import '../../colors.dart';
import '../../size_config.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = new TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  bool pressed = false;
  bool loading = false;
  bool active = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference recipes = _firestore.collection('Recipe');
    return loading
        ? Loading()
        : Scaffold(
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
            body: FutureBuilder<DocumentSnapshot>(builder:
                (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(
                                  fontSize: 17, color: textColor, height: 1.0),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0.8),
                                filled: true,
                                fillColor: Colors.white24,
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: primaryColor,
                                ),
                                hintText: "Ara...",
                                hintStyle: TextStyle(color: primaryColor),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Colors.orange,
                                        width: 1.0,
                                        style: BorderStyle.solid)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Colors.orange,
                                        width: 1.0,
                                        style: BorderStyle.solid)),
                              ),
                              textInputAction: TextInputAction.done,
                              cursorColor: Colors.orange,
                              controller: _searchController,
                            ),

                            RaisedButton(
                              onPressed: () async {
                                setState(() {
                                  pressed = true;
                                  //loading = true;
                                });
                                findIntgredient(_searchController.text);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 35.0,
                                width: size.width * 0.3,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    gradient: new LinearGradient(colors: [
                                      Color(0xFFFF8C3B),
                                      Color(0xFFFF6365)
                                    ])),
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  "Ara",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            //Text(pressed == true ? liste.toString() : ""),
                            SizedBox(
                                height: 500,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.defaultSize * 0.5),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: SizeConfig.orientation ==
                                              Orientation.landscape
                                          ? 2
                                          : 1,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing:
                                          SizeConfig.orientation ==
                                                  Orientation.landscape
                                              ? SizeConfig.defaultSize * 2
                                              : 0,
                                      childAspectRatio: 1.65,
                                    ),
                                    itemCount: nameList.length,
                                    itemBuilder: (context, index) => AAA(
                                      name: nameList[index],
                                      imageUrl: imageList[index],
                                      time: times[index],
                                      cheff: chefNames[index],
                                      color: color[index],
                                      press: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RecipeDetail(
                                                      id: idList[index])),
                                        );
                                      },
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
            }),
            bottomNavigationBar: MyBottomNav(
              isactive: active,
            ),
          );
  }
}
