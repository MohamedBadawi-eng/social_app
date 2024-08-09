import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:intl/intl.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubits/cubit/cubit.dart';
import '../../../shared/cubits/cubit/states.dart';



class TasksToDoScreen extends StatelessWidget
{


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBootomSheetShown = false;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  TasksToDoScreen({super.key});



  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (context)
      {
        return AppCubit()..createDatabase();
      },
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state)
        {

        },
        builder: (BuildContext context , state)
        {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: IconButton(icon:const Icon(IconBroken.Arrow___Left_2), onPressed: ()
              {
                Navigator.pop(context);
              },),
              titleSpacing: 0,
              title: const Row(
                children:
                [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://st.depositphotos.com/22162388/51492/i/450/depositphotos_514926692-stock-photo-chat-bot-customer-service-automation.jpg'),
                    radius: 20,

                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Row(
                        children:
                        [
                          Text('Tasks To Do',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                          SizedBox(width: 10,),
                          Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                        ],
                      ),
                      Text('Bot',style: TextStyle(color:Colors.grey,fontSize: 14)),
                    ],
                  ),

                ],
              ),

              actions:
              [
                IconButton(onPressed: (){}, icon:const  Icon(Icons.more_vert_outlined)),
              ],
              elevation: 1,
            ),
            floatingActionButton: FloatingActionButton(
              child: isBootomSheetShown? Icon(Icons.add):Icon(Icons.edit),
              onPressed: () async
              {

                if(isBootomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    AppCubit.get(context).insertToDatabase(titlee: titleController.text, time: timeController.text, date: dateController.text);
                    titleController.text='';
                    timeController.text='';
                    dateController.text='';
                    Navigator.pop(context);
                    isBootomSheetShown=false;
                  }

                }
                else
                {
                  scaffoldKey.currentState?.showBottomSheet((context)
                  {
                    return Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                            [
                              SizedBox(height: 20,),
                              defaultTextField(
                                radius:  40,
                                labelText: 'Task Title',
                                prefixIcon: Icon(Icons.title_outlined),
                                controller: titleController,
                              ),
                              SizedBox(height: 20,),
                              defaultTextField(
                                controller: timeController,
                                radius:  40,
                                labelText: 'Task Time',
                                prefixIcon: Icon(Icons.timer_outlined),
                                onTap: ()
                                {
                                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                                      .then((value)
                                  {
                                    timeController.text=value!.format(context).toString();
                                  })
                                      .catchError((error)
                                  {
                                    print('Error in Entering');
                                  });
                                },
                              ),
                              SizedBox(height: 20,),

                              defaultTextField(
                                controller: dateController,
                                radius:  40,
                                labelText: 'Task Date',
                                prefixIcon: Icon(Icons.date_range),
                                onTap: ()
                                {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-05-03'),
                                  )
                                      .then((value)
                                  {
                                    dateController.text=DateFormat.yMMMd().format(value!);
                                  })
                                      .catchError((error)
                                  {
                                    print('Error in Entering    $error');
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });

                  isBootomSheetShown=true;
                }

              },
            ),
            body: ConditionalBuilder(
              builder: (context)
              {
                return AppCubit.get(context).screens[AppCubit.get(context).index];
              },
              fallback: (BuildContext context)
              {
                return Center(child: CircularProgressIndicator());
              },
              condition: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:AppCubit.get(context).index ,
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(Icons.table_rows_sharp),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done_all),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
              onTap: (index)
              {
                AppCubit.get(context).changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }




}


