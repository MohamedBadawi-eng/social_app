import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/shared/components/components.dart';
import 'package:social/shared/cubits/layout/layout_states.dart';

import '../modules/main_screens/social_post_screen.dart';
import '../shared/cubits/layout/layout_cubit.dart';

class SocialLayout extends StatelessWidget
{


  @override
  Widget build(BuildContext context)
  {

    return    BlocConsumer<SocialCubit,SocialAppStates>(
          listener: (context,state)
          {
            if(state is SocialNewPostState)
              {
                navigatorTo(context, PostScreen());
              }
          },
          builder: (context,state)
          {


            SocialCubit cubit = SocialCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(cubit.titles[cubit.currentIndex],style: const TextStyle(fontWeight: FontWeight.bold),),
                actions:
                [
                  IconButton(icon: const Icon(IconBroken.Notification),onPressed: (){},),
                  IconButton(icon: const Icon(IconBroken.Search),onPressed: (){},),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:Colors.blue,
                selectedIconTheme:const IconThemeData(color: Colors.blue),
                unselectedIconTheme:const IconThemeData(color: Colors.grey) ,
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                  cubit.changeBottomNav(index);
                },
                items:const
                [
                  BottomNavigationBarItem(icon: Icon(IconBroken.Home,),label: 'Home',),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Chat,),label: 'Chats'),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload,),label: 'Post'),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Category,),label: 'Bots'),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Setting,),label: 'Settings'),
                ],
              ),
              body: cubit.screens[cubit.currentIndex >2 ? cubit.currentIndex-1: cubit.currentIndex],
            );
          },


    );
  }
}
