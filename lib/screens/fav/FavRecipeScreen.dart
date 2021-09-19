import 'package:flutter/material.dart';
import 'package:food_app/Comps/my_bottom_nav.dart';
import 'package:food_app/screens/home/components/body.dart';
import 'package:food_app/screens/home/home_screen.dart';

import '../../size_config.dart';

class FavRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contect) => HomeScreen()));
              }),
          centerTitle: true,
          title: Image.asset('assets/images/logo.png'),
          actions: <Widget>[
            SizedBox(
              width: SizeConfig.defaultSize * 0.5,
            )
          ]),
      body: Body(),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
