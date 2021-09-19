import 'package:flutter/material.dart';
import 'package:food_app/net/service.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/profil/profilScreen.dart';
import 'package:food_app/screens/search/searchScreen.dart';

class NavItem {
  final int id;
  final Widget icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;

  void changeNavIndex({int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: IconButton(
          icon: const Icon(Icons.home),
          iconSize: 30,
          onPressed: () {
            nameList.clear();
          }),
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: IconButton(
          icon: const Icon(Icons.search), iconSize: 30, onPressed: () {}),
      destination: SearchScreen(),
    ),
    NavItem(
      id: 3,
      icon: IconButton(
          icon: const Icon(Icons.person),
          iconSize: 30,
          onPressed: () {
            nameList.clear();
          }),
      destination: ProfilScreen(),
    ),
  ];
}
