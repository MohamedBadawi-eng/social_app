import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/components/components.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
        create:(context)
        {
          return NewsCubit();
        },
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return  Scaffold(
            appBar: AppBar(),
            body : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children:
                [
                  Container(
                    height: 50,
                    child: defaultTextField(
                      controller: searchController,
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      radius: 50,
                      onChanged: (value)
                      {
                        NewsCubit.get(context).getSearch(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                                itemBuilder: (context,index)
                                {
                                print( NewsCubit.get(context).search[index].toString());
                                return buildNewsItem(
                                NewsCubit.get(context).search[index],context,
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
                                itemCount: NewsCubit.get(context).search.length,
                              ),
                  ),

                ],
              ),
            ),
          );
        },
      )
      ,
    );
  }
}
