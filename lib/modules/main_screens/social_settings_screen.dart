import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/main.dart';
import 'package:social/modules/main_screens/social_edit_profile_screen.dart';

import 'package:social/shared/components/components.dart';
import 'package:social/shared/cubits/layout/layout_cubit.dart';
import 'package:social/shared/cubits/layout/layout_states.dart';
import 'package:social/shared/network/local/cache_helper.dart';

import '../../models/social_user_model.dart';

class SettingsScreen extends StatelessWidget
{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialAppStates>(
      listener: (context , state)
      {

      },
      builder: (context , state)
      {
        SocialUserModel? userDataFromCubit = SocialCubit.get(context).userModelData;
        // String name = userDataFromCubit!.name;
        String name = 'Mohamed Badawi';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            children:
            [
              Stack(
                alignment: Alignment.bottomCenter,
                children:
                [
                  Container(
                    height: 180,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: NetworkImage('https://i.pinimg.com/736x/06/e1/7a/06e17abff48ce4268368db209a0de46b.jpg'),
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const SizedBox(width: 5,),
                  const Icon(Icons.check_circle,color: Colors.blue,size: 16,)
                ],
              ),
              const  Text('To Be Or Not To Be',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Row(
                children:
                [
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child:const Column(
                        children:
                        [
                          Text('100',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Posts',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child: const Column(
                        children:
                        [
                          Text('236',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Photos',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child:const Column(
                        children:
                        [
                          Text('10k',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Followers',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child:const  Column(
                        children:
                        [
                          Text('56',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Followings',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children:
                [
                  Expanded(child: OutlinedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Make the edges sharp
                            side:const  BorderSide(color: Colors.blue), // Add an outer border
                          ),
                        ),
                      ),

                      child:const Text('Add Photos')),

                  ),
                  const SizedBox(width: 5,),
                  OutlinedButton(
                    onPressed: ()
                    {
                      navigatorTo(context, EditProfileScreen());
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Make the edges sharp
                          side:const  BorderSide(color: Colors.blue), // Add an outer border
                        ),
                      ),
                    ),
                    child:const Icon(IconBroken.Edit),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const  Spacer(),
              TextButton(onPressed: ()
              {
                 SocialCubit.get(context).logout(context);
              }, child: const Text('Logout',style: TextStyle(color: Colors.red,fontSize: 20),),)
            ],
          ),
        );
      },
    );
  }
}