import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:panasiatech/module/login/model/LoginRequest.dart';
import 'package:panasiatech/module/login/model/LoginResponse.dart';
import 'package:panasiatech/module/login/repo/login_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepo _repo;

  bool isHidden = true;

  LoginBloc({@required LoginRepo repo})
      : assert(repo != null),
        _repo = repo;

  @override
  get initialState => LoginUninitialized();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events,
      TransitionFunction<LoginEvent, LoginState> transitionFn,) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is PasswordIconClick) {
      isHidden = !isHidden;
      yield PasswordIconUpdate(isHidden: isHidden);
    }
    if (event is Initial) {
      yield LoginUninitialized();
    }
    if (event is Login) {
      try {
        yield LoginLoading();
        LoginRequest request = LoginRequest(email: event.email, password: event.password);
        LoginResponse response = await _repo.login(request);
        yield LoginSuccess(token: response.token);
      } catch (_) {
        yield LoginFailure();
      }
    }
  }

}