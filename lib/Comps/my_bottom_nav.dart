import 'package:flutter/material.dart';
import 'package:food_app/colors.dart';
import 'package:food_app/models/NavItem.dart';
import 'package:food_app/size_config.dart';
import 'package:provider/provider.dart';

class MyBottomNav extends StatelessWidget {
  final bool isactive;
  const MyBottomNav({Key key, this.isactive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 30,
            color: Color(0xFF4B1A39).withOpacity(0.2),
          )
        ]),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navItems.items.length,
              (index) => buildIconNavBottom(
                  isActive: navItems.selectedIndex == index ? true : false,
                  iconn: navItems.items[index].icon,
                  press: () {
                    navItems.changeNavIndex(index: index);

                    if (navItems.items[index].destinationChecker())
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                navItems.items[index].destination,
                          ));
                  }),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconNavBottom(
      {Widget iconn, Function press, bool isActive = false}) {
    return IconButton(
        icon: iconn,
        color: isActive ? primaryColor : Color(0XFFD1D4D4),
        onPressed: press);
  }
}
