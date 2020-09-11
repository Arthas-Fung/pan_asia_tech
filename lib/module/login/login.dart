import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';


class LoginRoute extends StatefulWidget {
  LoginRoute({ Key key }) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  LoginBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = BlocProvider.of<LoginBloc>(context);
    _postBloc.add(Login("eve.holt@reqres.in", "cityslicka"));
//    _postBloc.add(Login("aaa", "bbb"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginFail) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is LoginSuccess) {
//          if (state.token) {
            return Center(
              child: Text(state.token),
            );
//          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}