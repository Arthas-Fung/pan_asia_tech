import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/login/bloc/login_bloc.dart';
import 'module/login/login.dart';
import 'module/login/repo/login_repo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute (),
  ));
}

class FirstRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    Timer(Duration(seconds: 3), () {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) =>
              LoginBloc(repo: LoginRepoImpl()),
          child: LoginRoute(),
        ),
//            DetailRoute(id: id),
        )
    );
//    });

    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Container(

      ),
    );
  }

}