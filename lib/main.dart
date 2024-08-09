import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layout/social_layout_screen.dart';
import 'package:social/shared/cubits/layout/layout_cubit.dart';
import 'package:social/shared/cubits/login/login_cubit.dart';
import 'package:social/shared/cubits/register/register_cubit.dart';
import 'package:social/shared/network/local/bloc_observer.dart';
import 'package:social/shared/network/local/cache_helper.dart';
import 'package:social/shared/network/remote/dio.dart';
import 'firebase_options.dart';
import 'modules/main_screens/social_login_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.int();
  await CacheHelper.init();
  String? uId= CacheHelper.getStringData(key: 'uId');

  runApp(MyApp(uId: uId,));
}

class MyApp extends StatelessWidget
{
  String? uId;
  MyApp( {required this.uId,super.key});

  @override
  Widget build(BuildContext context)
  {
    print('UID is ---->  ${uId}');
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(
           create: (context)
          {
            return SocialCubit()..getUidFromMain(uId)..getUserData();
          }),

          BlocProvider(
          create: (context)
          { return LoginCubit(); },),

          BlocProvider(
           create: (context)
         { return RegisterCubit(); },),
        ],
        child: MaterialApp(
    home: uId==''? SocialLoginScreen( ):SocialLayout(),
  debugShowCheckedModeBanner: false,
  ),

    );
  }
}

