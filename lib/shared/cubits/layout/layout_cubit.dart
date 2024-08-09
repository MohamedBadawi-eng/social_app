import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/modules/main_screens/social_settings_screen.dart';
import 'package:social/shared/cubits/layout/layout_states.dart';

import '../../../main.dart';
import '../../../models/social_user_model.dart';
import '../../../modules/main_screens/social_bots_screen.dart';
import '../../../modules/main_screens/social_chat_screen.dart';
import '../../../modules/main_screens/social_home_screen.dart';
import '../../../modules/main_screens/social_login_screen.dart';
import '../../components/components.dart';
import '../../network/local/cache_helper.dart';

class SocialCubit extends Cubit<SocialAppStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context)
  {
    return BlocProvider.of(context);
  }

  int currentIndex = 0 ;
  void changeBottomNav(int index)
  {
    if(index==4)
      {
        getFromCacheAndFirebase();
      }
    if(index==2)
      {
        emit(SocialNewPostState());
        currentIndex = 0;
      }
    else
      {
        currentIndex = index;
        emit(SocialChangeBottomNavState());
      }

  }

  List<Widget> screens = const
  [
    HomeScreen(),
    ChatScreen(),
    BotsScreen(),
    SettingsScreen(),
  ];

  List<String> titles =
  [
    'Home',
    'Chats',
    'Post',
    'Bots',
    'Settings',
  ];


  String? uIDFromMain;
  String? getUidFromMain(String? uid)
  {
    uIDFromMain = uid;
  }

  SocialUserModel? userModelData;
  Future<void> getUserData() async
  {
    emit(SocialGetUserDataLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uIDFromMain)
        .get()
        .then((value)
    {
      userModelData = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserDataSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SocialGetUserDataErrorState());
    });
  }

 void getFromCacheAndFirebase()
 {
   getUidFromMain(CacheHelper.getStringData(key: 'uId'));
   print(uIDFromMain);
   getUserData();
 }



  // Setting Screen
  void logout(context)
  {
    emit(SocialLogoutLoadingState());
    currentIndex = 0;
    CacheHelper.putStringData(key: 'uId', value: '');
    //main();
    emit(SocialLogoutSuccessState());
    navigatorToAndFinish(context, SocialLoginScreen());
    emit(SocialInitialState());
  }




  // Edit Profile Screen

   File? profileImage;

  Future<void> getProfileImage() async
  {
    var picker = ImagePicker();
    final pickedFile  = await picker.pickImage(
      source : ImageSource.gallery,
    );

    if (pickedFile != null)
    {
      profileImage =  File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    }
    else
      {
        print('Error no profileImage selected');
        emit(SocialProfileImagePickedErrorState());

      }

  }

   File? coverImage;
  Future<void> getCoverImage() async
  {
    var picker = ImagePicker();
    final pickedFile  = await picker.pickImage(
      source : ImageSource.gallery,
    );

    if (pickedFile != null)
    {
      coverImage =  File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    }
    else
    {
      print('Error no coverImage selected');
      emit(SocialCoverImagePickedErrorState());

    }

  }



  // Add post  Screen

  File? postImage;
  Future<void> getPostImage() async
  {
    var picker = ImagePicker();
    final pickedFile  = await picker.pickImage(
      source : ImageSource.gallery,
    );

    if (pickedFile != null)
    {
      postImage =  File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    }
    else
    {
      print('Error no postImage selected');
      emit(SocialPostImagePickedErrorState());

    }

  }

  void removePostImage()
  {
    postImage=null;
    emit(SocialPostImageDeletedState());
  }

}