import 'package:flutter/material.dart';

import '../size_config.dart';

AppBar buildAppBar() {
  return AppBar(
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
      ]);
}
