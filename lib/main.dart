import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/login/bloc/login_bloc.dart';
import 'module/login/login_page.dart';
import 'module/login/repo/login_repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pan Asia Tech',
      home: BlocProvider(
        create: (context) => LoginBloc(repo: LoginRepoImpl()),
        child: LoginRoute(),
      ),
    );
  }
}