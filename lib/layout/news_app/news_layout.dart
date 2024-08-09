
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';


import '../../modules/main_screens/social_bots_screen.dart';
import '../../modules/social_bots_screens/news/search_screen.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'cubit/theme_cubit.dart';

class NewsLayout extends  StatelessWidget
{
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (context)
      {
        return NewsCubit()..getBusiness();
      },
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state)
        {

        },
        builder: (context, state)
        {

          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
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
                    backgroundImage: NetworkImage('https://i0.wp.com/mediashift.org/wp-content/uploads/2017/12/news-apps.jpg?w=2000'),
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
                          Text('News App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
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
            body:cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentIndex,
              onTap: (index)
              {
                cubit.ChangeBottomItems(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
