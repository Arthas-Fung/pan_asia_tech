import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Initial extends LoginEvent {
  @override
  List<Object> get props => [];
}

class PasswordIconClick extends LoginEvent {
  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final String email;
  final String password;

  const Login(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}