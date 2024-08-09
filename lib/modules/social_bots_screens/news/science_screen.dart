import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/components/components.dart';


class ScienceScreen extends StatelessWidget
{
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit,NewsStates>
      (

      builder: (BuildContext context, NewsStates state)
      {
        return ListView.separated(
          itemBuilder: (context,index)
          {
            print( NewsCubit.get(context).science[index].toString());
            return buildNewsItem(
                NewsCubit.get(context).science[index],context
            );
          },
          separatorBuilder:(context,index)
          {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0,),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            );
          },
          itemCount: NewsCubit.get(context).science.length,
        );
      },
      listener: (BuildContext context, NewsStates state)
      {  },

    );
  }
}