import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Comps/loading.dart';
import 'package:food_app/net/flutterfire.dart';
import 'package:food_app/net/service.dart';
import 'package:food_app/screens/home/components/background.dart';
import 'package:food_app/screens/login/loginScreen.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            body: Background(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(labelText: "User Name"),
                      controller: _name,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(labelText: "Email"),
                      controller: _email,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(labelText: "Password"),
                      controller: _password,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: RaisedButton(
                      onPressed: () async {
                        bool shouldNavigate =
                            await register(_email.text, _password.text);
                        User updateUser = FirebaseAuth.instance.currentUser;
                        updateUser.updateProfile(displayName: _name.text);
                        userSetup(_name.text);
                        if (shouldNavigate) {
                          loading = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(colors: [
                              Color(0xFFFF8C3B),
                              Color(0xFFFF6365)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
