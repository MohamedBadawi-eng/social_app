abstract class LoginAppStates {}

class LoginInitialState extends LoginAppStates{}

class LoginVisiblePasswordState extends LoginAppStates{}

class LoginLoadingState extends LoginAppStates{}

class LoginSuccessState extends LoginAppStates{}

class LoginErrorState extends LoginAppStates
{
  final String error;
  LoginErrorState(this.error);
}

