import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/shared/cubits/layout/layout_cubit.dart';
import 'package:social/shared/cubits/layout/layout_states.dart';

class PostScreen extends StatelessWidget
{
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = SocialCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Create Post ',style: TextStyle(fontWeight: FontWeight.bold),),
              titleSpacing: 3,
              leading: IconButton(
                onPressed: ()
                {
                  Navigator.pop(context);

                },
                icon: const Icon(IconBroken.Arrow___Left_2),
              ),
              actions:
              [
                MaterialButton(onPressed: ()
                {

                },
                  child: const Text('POST',style: TextStyle(fontSize: 20,color: Colors.blue),),)
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                   //  const  LinearProgressIndicator(),
                    const  SizedBox(height: 10,),
                    Row(
                      children:
                      [
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
                          radius: 30,
                        ),
                        SizedBox(width: 15,),
                        Text('Mohamed Badawi ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'what is on your mind ... ',
                          border: InputBorder.none
                      ),
                    ),
                    // const Spacer(),
                    cubit.postImage==null?
                    SizedBox() :
                    Stack(
                      alignment: Alignment.topRight,
                      children:
                      [
                        Image(
                          image:FileImage(cubit.postImage!),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ) ,
                        IconButton(
                          icon: Icon(Icons.highlight_remove_sharp,color: Colors.blue,),
                          onPressed: () {
                            cubit.removePostImage();
                          },),
                      ],
                    ),
                    SizedBox(height: 470,),
                    Row(
                      children:
                      [
                        const SizedBox(width: 40,),
                        Expanded(
                          child: InkWell(
                            onTap: ()
                            {
                              cubit.getPostImage();
                            },
                            child: const  Row(
                              children:
                              [
                                Icon(IconBroken.Image,color: Colors.blue,),
                                SizedBox(width: 5,),
                                Text('Add Photo',style: TextStyle(fontSize: 20,color: Colors.blue),),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(onPressed: ()
                          {

                          }, child: Text('# tags',style: TextStyle(fontSize: 20,color: Colors.blue),),
                          ),
                        ),
                      ],
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