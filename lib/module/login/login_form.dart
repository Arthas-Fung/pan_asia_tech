import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class LoginFormRoute extends StatefulWidget {
  final bool isHidden;

  LoginFormRoute({ Key key, @required this.isHidden }) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginFormRoute> {
  LoginBloc _loginBloc;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
//  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
//  final _passwordController = TextEditingController(text: "cityslicka");

  login() {
    _loginBloc.add(Login(_emailController.text, _passwordController.text));
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 0, top: 50, right: 50, bottom: 0),
                  child: Image(image: AssetImage('lib/assets/images/login.png')),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50, top: 50, right: 50, bottom: 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome Back!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xfffa5075),
                            fontSize: 22,

                          ),
                        ),
                        SizedBox(height: 12),
                        Text("Hi, Kindly login to continue battle",
                          style: TextStyle(
                            color: const Color(0xff030303),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 40),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: const Color(0xfffa5075)),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: const Color(0xfffa5075)),
                            ),
                            hintText: "password",
                            suffixIcon: IconButton(
                              onPressed: () => {
                                _loginBloc.add(PasswordIconClick()),
                              },
                              icon: widget.isHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                            ),
                          ),
                          obscureText: widget.isHidden,
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("Forgot Password?"),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: double.infinity),
                            FlatButton(
                              child: Text("Let’s Combat!"),
                              padding: const EdgeInsets.only(left: 50, top: 15, right: 50, bottom: 15),
                              color: const Color(0xfffa5075),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: const Color(0xfffa5075))
                              ),
                              onPressed: () => login(),
                            ),
                            SizedBox(height: 70),
                            Text("Don’t have an account?",
                              style: TextStyle(
                                color: const Color(0xff030303),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("Create Account",
                              style: TextStyle(
                                color: const Color(0xfffa5075),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}