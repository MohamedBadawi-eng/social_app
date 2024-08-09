import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubits/cubit/cubit.dart';
import '../../../shared/cubits/cubit/states.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit , AppStates>(
        builder: (context,state)
        {
          var tasks = AppCubit.get(context).newTasks;
          return ConditionalBuilder(
            condition: tasks!.length > 0,
            fallback: (context)
            {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Icon(Icons.menu,size: 100,color: Colors.grey,),
                    Text('No Tasks yet , please add Some TAsks '),
                  ],
                ),
              );
            },
            builder: (context)
            {
              return ListView.separated(
                itemBuilder: (context,index)
                {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: buildTaskItem(tasks[index],context),
                  );
                },
                separatorBuilder: (context,index)
                {
                  return SizedBox(height: 5,);
                },
                itemCount: tasks!.length,
              );
            },

          );
        },
        listener: (context,state)
        {

        },
    );
  }
}
