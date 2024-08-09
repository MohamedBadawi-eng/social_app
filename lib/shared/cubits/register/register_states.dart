abstract class RegisterAppStates {}

class RegisterInitialState extends RegisterAppStates{}

class RegisterVisiblePasswordState extends RegisterAppStates{}

class RegisterLoadingState extends RegisterAppStates{}

class RegisterSuccessState extends RegisterAppStates{}

class RegisterErrorState extends RegisterAppStates
{
  final String error;
  RegisterErrorState(this.error);

}

class RegisterCreateSuccessState extends RegisterAppStates{}

class RegisterCreateErrorState extends RegisterAppStates
{
  final String error;
  RegisterCreateErrorState(this.error);

}
