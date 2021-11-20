import 'dart:async';

import 'package:ax_flutter_demo/module/authentication/authentication_bloc.dart';
import 'package:ax_flutter_demo/module/authentication/authentication_event.dart';
import 'package:ax_flutter_demo/module/login/model/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
//  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
//    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginSuccess());

  LoginState get initialState => LoginSuccess();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print("LoginButtonPressed=============authenticationBloc ${authenticationBloc}");

    if (event is LoginButtonPressedEvent) {
      print("LoginButtonPressed=============");
      yield LoginInProgress();

      try {
//        final token = await userRepository.authenticate(
//          username: event.username,
//          password: event.password,
//        );

        print('event.username = ${event.username}');
        print('event.password = ${event.password}');
        print('authenticationBloc = ${authenticationBloc}');
        await Future.delayed(Duration(seconds: 3));

        /// 这个是告诉 main 跳转 root
        authenticationBloc.add(AuthenticationLoggedInEvent(user: UserRepository(username: event.username, password: event.password)));
        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
