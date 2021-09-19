import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/NavItem.dart';
import 'package:food_app/screens/login/loginScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodistic',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
