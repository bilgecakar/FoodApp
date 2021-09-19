import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitCircle(
          color: primaryColor,
          size: 80.0,
          duration: const Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
