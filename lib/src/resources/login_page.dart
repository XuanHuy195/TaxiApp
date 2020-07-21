import 'package:TaxiApp/src/resources/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:TaxiApp/src/blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBLoc = new LoginBloc();
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Image.asset('assets/ic_car_green.png'),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "WelCome Back!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff333333),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Login to continue use Icab",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff606470),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            StreamBuilder(
                stream: loginBLoc.userStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<Object>(
                stream: loginBLoc.passStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              constraints: BoxConstraints.loose(
                Size(double.infinity, 30),
              ),
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                "Forgot Pasword?",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff606470),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: onSignInClicked,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                color: Colors.blue[700],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(
                  text: "New user? ",
                  style: TextStyle(color: Color(0xff606470), fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                      text: "Sign up for a new account",
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSignInClicked() {
    setState(
      () {
        if (loginBLoc.isValidInfo(_userController.text, _passController.text)) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      },
    );
  }
}
