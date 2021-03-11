import 'package:ax_flutter_demo/module/login/model/user_repository.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStartedEvent extends AuthenticationEvent {}

class AuthenticationLoggedInEvent extends AuthenticationEvent {
  final UserRepository user;

  const AuthenticationLoggedInEvent({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { token: $user }';
}

class AuthenticationLoggedOutEvent extends AuthenticationEvent {}
