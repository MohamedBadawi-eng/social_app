
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/models/social_user_model.dart';
import 'package:social/shared/components/components.dart';
import 'package:social/shared/cubits/layout/layout_cubit.dart';
import 'package:social/shared/cubits/layout/layout_states.dart';

class EditProfileScreen extends StatelessWidget
{
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return  BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state) async
      {

      } ,
      builder: (context,state)
      {
        var cubit = SocialCubit.get(context);
        SocialUserModel? userDataFromCubit = SocialCubit.get(context).userModelData;
        
         // nameController.text=userDataFromCubit!.name;
         // bioController.text=userDataFromCubit.name;
         // phoneController.text=userDataFromCubit.phone;

         nameController.text='Mohamed Badawi';
         bioController.text='To Be Or Not To Be';
         phoneController.text='0106975066';

        return Scaffold(
          appBar: AppBar(
            leading:IconButton(
              icon: const  Icon(IconBroken.Arrow___Left_2),
              onPressed: ()
              {
                Navigator.pop(context);
              },),
            title:
            const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold),),
            titleSpacing: 2,
            actions:
            [
              MaterialButton(
                onPressed: (){},
                child:const  Text('UPDATE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 17,
                  ),),),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: SingleChildScrollView(
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
                        child: Stack(
                          children:
                          [
                            Align(
                              alignment: Alignment.topCenter,
                              child: cubit.coverImage==null? const Image(
                                image: NetworkImage('https://i.pinimg.com/736x/06/e1/7a/06e17abff48ce4268368db209a0de46b.jpg'),
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ):Image(
                                image:FileImage(cubit.coverImage!),
                                fit: BoxFit.cover,
                                height: 130,
                                width: double.infinity,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.blue,
                                  child: IconButton(icon:const  Icon(IconBroken.Camera,size: 15,color: Colors.white,), onPressed: ()
                                  {
                                    cubit.getCoverImage();
                                  },),
                                ),
                              ),
                            ),
                          ] ,
                        ),

                      ),
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child:cubit.profileImage==null? Image(image:const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          ):
                          Image(image: FileImage(cubit.profileImage!),
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          ) ,
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blue,
                              child: IconButton(icon:const  Icon(IconBroken.Camera,size: 15,color: Colors.white,),
                                onPressed: ()
                                {
                                  cubit.getProfileImage();

                                },),
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  defaultTextField(
                    controller: nameController,
                    radius: 5,
                    labelText: 'Name',
                    prefixIcon: const Icon(IconBroken.User),
                  ),
                  const SizedBox(height: 10,),
                  defaultTextField(
                    controller: bioController,
                    radius: 5,
                    labelText: 'Bio',
                    prefixIcon:const  Icon(IconBroken.Info_Circle),
                  ),
                  const SizedBox(height: 10,),
                  defaultTextField(
                    controller: phoneController,
                    radius: 5,
                    labelText: 'Phone',
                    prefixIcon:const  Icon(IconBroken.Call),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}