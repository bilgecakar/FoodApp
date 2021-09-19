import 'package:flutter/material.dart';
import 'package:food_app/size_config.dart';
import 'recipe_menu.dart';

class Body extends StatelessWidget {
  List<String> materials = ["Olivie Oil", "Onion", "Garlic", "Tomato", "Water"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image(
          image: AssetImage('assets/images/recipetthree.png'),
          width: SizeConfig.screenWidth,
          height: 280,
        ),
        Expanded(
          child: Container(
            height: 800,
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RecipeMenu(
                  iconSrc: "assets/images/chef-hat.png",
                  title: "James McWoy",
                ),
                RecipeMenu(
                  iconSrc: "assets/images/clock.png",
                  title: "30 minutes",
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
                  child: Text(
                    "INGREDIENTS",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: materials.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFDDDDDD),
                                  style: BorderStyle.solid,
                                  width: .5))),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.black45,
                            ),
                          ),
                          Text(
                            (materials[index]),
                            style: TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Step 1 Heat oil in a large pot over medium-high heat. Add chicken, onion, chipotle peppers, garlic, and garlic salt; cook and stir until lightly browned, 5 to 8 minutes.Step 2Stir enchilada sauce, hominy, tomatoes, black beans, and water into the pot. Season with chili powder, cumin, oregano, cayenne pepper, salt, and pepper. Bring to a gentle boil. Cover and simmer until flavors combine, about 40 minutes. Garnish with cilantro.",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
