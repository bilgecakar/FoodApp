import 'package:flutter/material.dart';
import 'package:food_app/Comps/loading.dart';
import 'package:food_app/net/flutterfire.dart';
import 'package:food_app/screens/home/components/background.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/register/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

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
                      "LOGIN",
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
                            await signIn(_email.text, _password.text);
                        if (shouldNavigate == true) {
                          setState(() {
                            loading = true;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
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
                          "LOGIN",
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
                                builder: (context) => RegisterScreen()))
                      },
                      child: Text(
                        "Don't Have an Account? Sign up",
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
