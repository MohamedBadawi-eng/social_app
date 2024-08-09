
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/shared/cubits/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/social_bots_screens/todo/archived_screen.dart';
import '../../../modules/social_bots_screens/todo/done_screen.dart';
import '../../../modules/social_bots_screens/todo/task_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)
  {
    return BlocProvider.of<AppCubit>(context);
  }

  Database? database;

  int index = 0;
  List<Widget> screens =
  [
    TaskScreen(),
    DoneScreen(),
    ArchivedScreen(),
  ];
  List<String> title =
  [
    'Tasks',
    'Done',
    'Archived',
  ];

  void changeIndex (int index)
  {
    this.index = index;
    emit(AppChangeBottomNavBarState());
  }


  List<Map<dynamic, dynamic>>? Tasks = [];
  List<Map<dynamic, dynamic>>? newTasks = [];
  List<Map<dynamic, dynamic>>? doneTasks = [];
  List<Map<dynamic, dynamic>>? archivedTasks = [];


  void createDatabase ()
  {
     openDatabase(
      'todoo.db',
      version: 1,
      onCreate: (database,version)
      {
        print('Database Created ');
        database.execute('CREATE TABLE tasks ( id INTEGER PRIMARY KEY , title TEXT , time TEXT , date TEXT, status TEXT)')
            .then((value)
        {
          print('Table Created');
        })
            .catchError((error)
        {
          print('Error in Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        print('DataBase Opend ');

      },
    ).then((value)
    {
      database = value;
      emit(AppCreatDatabaseState());
      getDataFromDatabase(database);
    }).catchError((onError)
    {

    });
  }





  void insertToDatabase(
      {
        required String titlee ,
        required String time,
        required String date ,
        String status = 'new' ,
      }) async
  {
     await database?.transaction((txn) async
    {
      await txn.rawInsert(
          'INSERT INTO tasks(title ,time ,date ,status) VALUES("$titlee","$time","$date","$status")');
      emit(AppInsertToDatabaseState());
      getDataFromDatabase(database);

    });
  }





  void getDataFromDatabase(database) async
  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];

    emit(AppGetFromDatabaseState());
    database?.rawQuery('SELECT * FROM tasks').then((value)
     {
       value?.forEach((element)
       {

         if(element['status'].toString() == 'new')
           {
             newTasks?.add(element);
           }
         else if (element['status'].toString()=='done')
           {
             doneTasks?.add(element);
           }
         else
           {
             archivedTasks?.add(element);
           }

       });

     });


  }


   void updateData ({
       required String status ,
       required int id ,}
      ) async
  {
    database?.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
    ['$status',id],
    ).then((value) async
    {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });

  }

  void deleteData ({
    required int id ,}
      ) async
  {

    database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id],
    ).then((value) async
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }




}