import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/shared/network/local/cache_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginAppStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)
  {

    return BlocProvider.of(context);
  }

  bool isPassword = true;

  void changVisibleState()
  {
    isPassword = !isPassword;
    emit(LoginVisiblePasswordState());
  }

  void userLogin({
  required String email,
    required String password,})
  {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
    .then((value)
    {
      emit(LoginSuccessState());
      print(value.user?.email);
      print(value.user?.uid);
      CacheHelper.putStringData(key: 'uId', value: value.user!.uid);
    }).catchError((error)
    {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }


}