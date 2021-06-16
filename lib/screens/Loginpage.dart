import 'package:catlog_app/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeinRoute);
      // await context.vxNav.push(Uri.parse(MyRoutes.homeinRoute));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Login page",
                  style: TextStyle(
                    // color: Colors.deepPurple,
                    fontSize: 29,
                  ),
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    // color: Colors.deepPurple,
                    fontSize: 29,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: 'Username'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Empty";
                          } else if (value.length < 8) {
                            return "Password incorrect";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: 'Password'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 100 : 8),
                        child: InkWell(
                          onTap: () => movetohome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changeButton ? 50 : 150,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
