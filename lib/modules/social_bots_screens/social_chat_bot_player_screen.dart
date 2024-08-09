import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/shared/cubits/player/player_cubit.dart';
import 'package:social/shared/cubits/player/player_states.dart';


class ChatPlayerBotScreen extends StatelessWidget {
  const ChatPlayerBotScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context)
      {
        return PlayerCubit()..getMusic()..releaseSong();
      },
      child: BlocConsumer<PlayerCubit,SocialPlayerStates>(
        listener: (context,state)
        {

          // For Conditional Builder
           if (state is PlayerInitialState || state is PlayerInitialState  || state is PlayerDurationListenSongState)
             {

             }
           else
             {
               PlayerCubit.get(context).conditonal=true;
             }


           // For Slider
           if (state is PlayerDurationListenSongState)
             {
               PlayerCubit.get(context).positionStream();
             }

        },
        builder: (context,state)
        {


          var cubit = PlayerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(icon:const Icon(IconBroken.Arrow___Left_2), onPressed: ()
              {
                cubit.close();
                cubit.stopMusic();
                Navigator.pop(context);
              },
                color: Colors.white,),

              titleSpacing: 0,
              title: const Row(
                children:
                [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/electric-guitar-with-neon-light-cyberpunk-style-by-generative-ai_919160-1209.jpg'),
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
                          Text('Music Player ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white)),
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
                IconButton(onPressed: (){}, icon:const  Icon(Icons.more_vert_outlined,color: Colors.white,)),
              ],
              elevation: 1,
              backgroundColor: Colors.deepPurple,
            ),
            body: Container(
              width: double.infinity,
              color: Colors.deepPurple,
              child: ConditionalBuilder(
                condition: cubit.conditonal,
                builder: (context)
                {
                  return Column(
                    children:
                    [


                      Stack(
                        alignment: Alignment.bottomCenter,
                        children:
                        [
                          cubit.isSongScreen?
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: 673,
                              child: Column(
                                children:
                                [
                                  Text('Song',style: TextStyle(fontSize: 25,color: Colors.white)),
                                  const SizedBox(height: 5,),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: const Image(
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      image: NetworkImage('https://img.freepik.com/premium-photo/neon-illustration-gamer-wearing-headphones-headset_887562-1510.jpg'),),
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    children:
                                    [
                                      const SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:
                                        [
                                          SizedBox(
                                            width: 250,
                                            child: Text(cubit.audios![cubit.index!].title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white,
                                                 decorationColor: Colors.yellow,
                                                shadows: <Shadow>
                                                [
                                                  Shadow(
                                                    offset: Offset(3.0, 3.0), // تعيين إزاحة الظل
                                                    blurRadius: 3.0, // تعيين نصف قطر التمويه
                                                    color: Colors.blue.withOpacity(0.5), // تعيين لون الظل
                                                  ),
                                                  Shadow(
                                                    offset: Offset(3.0, 3.0), // تعيين إزاحة الظل
                                                    blurRadius: 3.0, // تعيين نصف قطر التمويه
                                                    color: Colors.blue.withOpacity(0.5), // تعيين لون الظل
                                                  ),
                                                  Shadow(
                                                    offset: Offset(3.0, 3.0), // تعيين إزاحة الظل
                                                    blurRadius: 3.0, // تعيين نصف قطر التمويه
                                                    color: Colors.deepPurple.withOpacity(0.5), // تعيين لون الظل
                                                  ),
                                                ],
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          SizedBox(
                                            width: 250,
                                            height: 20,
                                            child: Text(cubit.audios![cubit.index!].album.toString(),
                                              style: const TextStyle(fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(onPressed: (){}, icon: const Icon(IconBroken.Heart,size: 40,color: Colors.white,),
                                        highlightColor: Colors.red,),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Slider(
                                    min: 0,
                                    max: cubit.duration.inSeconds.toDouble(),
                                    value:cubit.position.inSeconds.toDouble(),
                                    activeColor: Colors.blue,
                                    onChanged:(value)
                                    {
                                      final position = Duration(seconds: value.toInt());
                                      cubit.seekSong(position);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      children:
                                      [

                                        Text( cubit.formatDuration(cubit.position.inSeconds),style: TextStyle(fontSize: 15 ,color: Colors.white),),
                                        Spacer(),
                                        Text( cubit.formatDuration(cubit.duration.inSeconds -cubit.position.inSeconds) ,style: TextStyle(fontSize:15 ,color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    [
                                      IconButton(onPressed: ()
                                      {
                                        cubit.changeShuffleState();

                                      },
                                          icon:Icon(cubit.isShuffle? Icons.shuffle_outlined : Icons.read_more_outlined,color: Colors.white,size: 30,)),
                                      IconButton(onPressed: ()
                                      {
                                        cubit.backSong(cubit.index!);
                                      }, icon:Icon(Icons.skip_previous_outlined,color: Colors.white,size: 40,)),
                                      IconButton(onPressed: ()
                                      {
                                        cubit.changeSongState();
                                        print(cubit.isPlay);
                                        if(!cubit.isPlay)
                                        {
                                          cubit.pauseMusic();

                                        }
                                        else
                                        {
                                          cubit.resumeMusic();

                                        }

                                      },
                                          icon:Icon(cubit.isPlay?
                                          Icons.pause_circle_outlined
                                              :IconBroken.Play,
                                            color: Colors.white,size: 60,)),
                                      IconButton(onPressed: ()
                                      {
                                        cubit.nextSong();
                                      }, icon:Icon(Icons.skip_next_outlined,color: Colors.white,size: 40,)),
                                      IconButton(onPressed: ()
                                      {
                                        cubit.changeRepeatState();
                                        // cubit.seekSong();
                                      }, icon:Icon(cubit.isRepeat? Icons.repeat : Icons.repeat_one,color: Colors.white,size: 30,)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ) : Column(
                            children:
                            [
                              Column(
                                children:
                                [

                                  Container(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 170,
                                      image: NetworkImage('https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D'),

                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50)),
                                      boxShadow:
                                      [
                                        BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 30,
                                        ),
                                        BoxShadow(
                                          color: Colors.blue[400]!,
                                          blurRadius: 30,
                                        ),
                                        BoxShadow(
                                          color: Colors.deepPurple[500]!,
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                  ),
                                  const  SizedBox(height: 10,),
                                ],
                              ),
                              Container(
                                height: 493,
                                child:  ListView.separated(
                                  itemBuilder: (context,index)
                                  {

                                    return InkWell(
                                      onTap: ()
                                      {
                                        cubit.stopMusic();
                                        cubit.isPlay=true;
                                        cubit.playMusic(index: index,
                                            path:cubit.audios![index].data );
                                        // cubit.isSongScreen=true;

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                            color: cubit.index==index?Colors.purple.withOpacity(.5):Colors.deepPurple,

                                          ),
                                          child: Column(
                                            children:
                                            [
                                              Row(
                                                children:
                                                [
                                                  Container(
                                                    child: Image(
                                                      image: NetworkImage('https://play-lh.googleusercontent.com/0LVaSfzLIb0KXaHMR5AvGPyRmEKSfi7l5I7yByJ5KH35IdXZyQalnMwI2VSCNsdYcqN1'),
                                                      height: 60,
                                                      width: 60,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),

                                                    ),
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  ),
                                                  const SizedBox(width: 20,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:
                                                    [
                                                      SizedBox(

                                                        child: Text(cubit.audios![index].title,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            shadows: <Shadow>
                                                            [
                                                              Shadow(
                                                                offset: Offset(3.0, 3.0), // تعيين إزاحة الظل
                                                                blurRadius: 3.0, // تعيين نصف قطر التمويه
                                                                color: Colors.blue.withOpacity(0.5), // تعيين لون الظل
                                                              ),
                                                              Shadow(
                                                                offset: Offset(3.0, 3.0), // تعيين إزاحة الظل
                                                                blurRadius: 3.0, // تعيين نصف قطر التمويه
                                                                color: Colors.black.withOpacity(0.5), // تعيين لون الظل
                                                              ),

                                                            ],
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        width: 192,
                                                      ),
                                                      Text(cubit.formatDuration(((cubit.audios![index].duration!)/1000).toInt()),style: TextStyle( fontSize: 14,color: Colors.grey)),

                                                    ],
                                                  ),
                                                  // Spacer(),
                                                  IconButton(onPressed:()
                                                  {

                                                  }, icon: Icon(IconBroken.Heart,color: Colors.white,)),
                                                  // IconButton(onPressed:()
                                                  // {
                                                  //
                                                  // }, icon: Icon(IconBroken.More_Circle,color: Colors.white,)),
                                                ],
                                              ),
                                              cubit.index==index?
                                              Column(
                                                children:
                                                [
                                                  Slider(
                                                                                      min: 0,

                                                                                      max: cubit.duration.inSeconds.toDouble(),
                                                                                      value:cubit.position.inSeconds.toDouble(),
                                                                                      activeColor: Colors.deepPurpleAccent,
                                                                                      onChanged:(value)
                                                                                      {
                                                                                      final position = Duration(seconds: value.toInt());
                                                                                      cubit.seekSong(position);
                                                                                      },
                                                                                      ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20),
                                                    child: Row(
                                                      children:
                                                      [

                                                        Text( cubit.formatDuration(cubit.position.inSeconds),style: TextStyle(fontSize: 13 ,color: Colors.white),),
                                                        Spacer(),
                                                        Text( cubit.formatDuration(cubit.duration.inSeconds -cubit.position.inSeconds) ,style: TextStyle(fontSize:13 ,color: Colors.white),),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ):const SizedBox(),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context,index)
                                  {
                                    return  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:  20.0),
                                      child: Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.grey[300]?.withOpacity(.3),
                                      ),
                                    );

                                  },
                                  itemCount: cubit.audios!.length,
                                ),

                              ),
                            ],
                          ),

                          Column(
                            children:
                            [
                              Container(
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 30,
                                    ),
                                    BoxShadow(
                                      color: Colors.blue[400]!,
                                      blurRadius: 30,
                                    ),
                                    BoxShadow(
                                      color: Colors.deepPurple[500]!,
                                      blurRadius: 20,
                                    ),
                                  ],
                                  color: Colors.deepPurple[500],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                        color:cubit.isSongScreen? null : Colors.grey ?.withOpacity(.2),
                                      ),
                                      child: TextButton(
                                        onPressed: ()
                                        {
                                          cubit.changeSongScreenState(false);
                                        },
                                        child:Text('Songs',style: TextStyle(fontSize: 20,color: Colors.white),

                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                        color:cubit.isSongScreen? Colors.grey ?.withOpacity(.2): null,
                                      ),
                                      child: TextButton(
                                        onPressed: ()
                                        {
                                          cubit.changeSongScreenState(true);
                                        },
                                        child:Text('Player',style: TextStyle(fontSize: 20,color: Colors.white),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),

                        ],
                      ),



                      Text('Dircted By Mohamed Badawi',style: TextStyle(fontSize: 10,color: Colors.grey)),


                    ],
                  );
                },
                fallback: (  context)
                {
                  return const Center(child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                  },
              ),
            ),
          );
        },
      ),
    );
  }
}


