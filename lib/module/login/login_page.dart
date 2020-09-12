import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panasiatech/module/home/home_page.dart';
import 'package:panasiatech/module/login/login_form.dart';

import 'bloc/bloc.dart';

class LoginRoute extends StatefulWidget {
  LoginRoute({ Key key }) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _loginBloc.add(Initial());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                    content: Container(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(),
                            Text("loading")
                          ],
                        ),
                    )
                );
              }
          );
        } else {
          Navigator.of(context).pop();
        }
        if (state is LoginFailure) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  content: Text("Login Failure"),
                  actions: [
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () => {
                        Navigator.of(context).pop()
                      },
                    ),
                  ],
                );
              }
          );
        }
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeRoute()),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return LoginFormRoute(isFailure: false);
        },
      ),
    );
  }

}