import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class LoginFormRoute extends StatefulWidget {
  final bool isFailure;

  LoginFormRoute({ Key key, @required this.isFailure }) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginFormRoute> {
  LoginBloc _loginBloc;

  bool _isHidden = true;
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "cityslicka");

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  login() {
    _loginBloc.add(Login(_emailController.text, _passwordController.text));
//    _loginBloc.add(Login("eve.holt@reqres.in", "cityslicka"));
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
                            hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "password",
                          suffixIcon: IconButton(
                            onPressed: () => _toggleVisibility,
                            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          ),
                        ),
                        obscureText: _isHidden,
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
        )
    );
  }

}