import 'package:flutter/material.dart';
import 'package:food_app/Comps/build_app_bar.dart';
import 'package:food_app/Comps/my_bottom_nav.dart';
import 'package:food_app/screens/home/components/category.dart';
import 'package:food_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Categories(),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
