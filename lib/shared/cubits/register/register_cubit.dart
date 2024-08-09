import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/models/social_user_model.dart';
import 'package:social/shared/cubits/register/register_states.dart';

class RegisterCubit extends Cubit<RegisterAppStates>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context)
  {
    return BlocProvider.of(context);
  }
  bool isPassword = true;

  void changVisibleState()
  {
    isPassword = !isPassword;
    emit(RegisterVisiblePasswordState());
  }

  void userRegister({
  required String email,
    required String password,
    required String name,
    required String phone,
})
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value)async
    {
      // emit(RegisterSuccessState());
      print(value.user?.email);
      print(value.user?.uid);

    await userCreate(name:name, email: email, phone: phone, uId: value.user!.uid);

    })
        .catchError((onError)
    {
      emit(RegisterErrorState(onError.toString()));
      print(onError.toString());
    }
    );
  }



  Future<void> userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,

})
  async {
    SocialUserModel model = SocialUserModel(
        email: email,
        phone: phone,
        name: name,
        uId: uId,
    );

      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap())
    .then((value)
      {
       emit(RegisterCreateSuccessState());
      })
    .catchError((error)
      {
       emit(RegisterCreateErrorState(error.toString()));
        print(error.toString());
      });
  }
}