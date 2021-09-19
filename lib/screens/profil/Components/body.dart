import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Comps/loading.dart';
import 'package:food_app/colors.dart';
import 'package:food_app/screens/login/loginScreen.dart';
import 'package:food_app/screens/profil/Components/profil_menu_item.dart';
import 'package:food_app/size_config.dart';

import 'info.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference user = _firestore.collection('User');
    String uid = auth.currentUser.uid.toString();
    return FutureBuilder<DocumentSnapshot>(
        future: user.doc(uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();

            return SingleChildScrollView(
              child: Column(
                children: [
                  Info(
                    image: "assets/images/pic.png",
                    name: data['displayName'],
                    email: auth.currentUser.email.toString(),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 2,
                  ),
                  ProfilMenuItem(
                    iconSrc: Icon(
                      Icons.help,
                      color: primaryColor,
                    ),
                    title: "Help",
                    press: () {},
                  ),
                  ProfilMenuItem(
                    iconSrc: Icon(
                      Icons.logout,
                      color: primaryColor,
                    ),
                    title: "Log Out",
                    press: () {
                      auth.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            );
          } //burda
        });
  }
}
