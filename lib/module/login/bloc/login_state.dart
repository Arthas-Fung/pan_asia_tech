import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginUninitialized extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess({
    this.token,
  });

  @override
  List<Object> get props => [token];

}