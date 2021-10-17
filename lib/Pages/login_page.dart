import 'package:flutter/material.dart';
import 'package:new_project/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
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
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 22, color: context.accentColor),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 22),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "UserName",
                            fillColor: context.accentColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "UserName cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be at least 6 or above";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Material(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              height: 50,
                              color: context.theme.buttonColor,
                              width: changeButton ? 80 : 150,
                              alignment: Alignment.center,
                              duration: Duration(seconds: 1),
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
