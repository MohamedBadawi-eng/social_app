
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layout/news_app/cubit/states.dart';


import '../../../modules/social_bots_screens/news/business_screen.dart';
import '../../../modules/social_bots_screens/news/science_screen.dart';
import '../../../modules/social_bots_screens/news/sports_screen.dart';
import '../../../shared/network/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)
  {
    return BlocProvider.of(context);
  }

  int currentIndex =  0;
  List<dynamic> business  = [];
  List<dynamic> sports  = [];
  List<dynamic> science  = [];
  List<dynamic> search  = [];

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_basketball),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
  ];


  List<Widget> Screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];



  void ChangeBottomItems (int index)
  {
    currentIndex = index;
    emit(NewsBottomNavState());
  }



  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        // url:'v2/top-headlines',
        url:'v2/everything',
        query:
    {
      // 'country':'us',
      // 'category':'business',
      // 'apiKey':'c1143763add4439db44e8ad2bfd87484',

      'q':'apple',
      'from':'2024-08-08',
      'to':'2024-08-08',
      'apiKey':'c1143763add4439db44e8ad2bfd87484',

    })
        .then((value)
           {
             business = value.data['articles'];
             print(business[0]['title']);
             emit(NewsGetBusinessSuccessState());
           })
        .catchError((error)
        {
          print(error.toString());
          emit(NewsGetBusinessErrorState(error.toString()));
        });
    getSports();
    getScience();
  }

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        // url:'v2/top-headlines',
        url:'v2/everything',
        query:
    {
      // 'country':'us',
      // 'category':'sports',
      // 'apiKey':'c1143763add4439db44e8ad2bfd87484',


      'q':'tesla',
      'from':'2024-07-09',
      'sortBy':'publishedAt',
      'apiKey':'c1143763add4439db44e8ad2bfd87484',
    })
        .then((value)
    {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    })
        .catchError((error)
    {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }


  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url:'v2/top-headlines', query:
    {
      // 'country':'us',
      // 'category':'science',
      // 'apiKey':'c1143763add4439db44e8ad2bfd87484',


      'sources':'techcrunch',
      'apiKey':'c1143763add4439db44e8ad2bfd87484',
    })
        .then((value)
    {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    })
        .catchError((error)
    {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }


  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url:'v2/everything',
        query:
    {

      'q':'$value',
      'apiKey':'c1143763add4439db44e8ad2bfd87484',
    })
        .then((value)
    {
      search = [];
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    })
        .catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}
