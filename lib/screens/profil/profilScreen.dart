import 'package:flutter/material.dart';
import 'package:food_app/Comps/my_bottom_nav.dart';
import 'package:food_app/colors.dart';
import 'package:food_app/screens/profil/Components/body.dart';
import '../../size_config.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
