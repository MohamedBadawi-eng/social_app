import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/modules/main_screens/social_bots_screen.dart';
import 'package:social/shared/components/components.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
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
              backgroundImage: NetworkImage('https://blog.bismart.com/hubfs/Imported_Blog_Media/los-10-mejores-bots-disponibles-en-Internet-Sep-26-2023-08-53-22-8616-AM.jpg#keepProtocol'),
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
                    Text('Evidence in the Qur’an',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              Text('Dircted By Mohamed Badawi',style: TextStyle(fontSize: 10,color: Colors.grey)),
              const SizedBox(height: 20,),
              Row(
                children:
                [
          
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://blog.bismart.com/hubfs/Imported_Blog_Media/los-10-mejores-bots-disponibles-en-Internet-Sep-26-2023-08-53-22-8616-AM.jpg#keepProtocol'),
                    radius: 15,
          
                  ),
                  SizedBox(width: 15,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft:Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hi, Iam Bomi ',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [
          
                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft:Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('How can I help you',style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [
          
                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft:Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose what you want ',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [
          
                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Row(
                            children:
                            [
                              Checkbox(value: true, onChanged: (boo)
                              {
          
                              }),
                              Text('Voice analysis',style: TextStyle(fontSize: 17),),
          
                            ],
                          ),
                          Row(
                            children:
                            [
                              Checkbox(value: false, onChanged: (boo)
                              {
          
                              }),
                              Text('Inquiring about a verse',style: TextStyle(fontSize: 17),),
          
                            ],
                          ),
          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                [
          
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.blue[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Voice analysis',style: TextStyle(fontSize: 17,color: Colors.white),),
                    ),
                  ),
                  SizedBox(width: 15,),
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
                    radius: 15,
          
                  ),
                ],
              ),
              const SizedBox(height:20,),
              Row(
                children:
                [
          
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://blog.bismart.com/hubfs/Imported_Blog_Media/los-10-mejores-bots-disponibles-en-Internet-Sep-26-2023-08-53-22-8616-AM.jpg#keepProtocol'),
                    radius: 15,
          
                  ),
                  SizedBox(width: 15,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Send the audio clip ..',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [
          
                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Text('Chlick Here To Record',style: TextStyle(fontSize: 17)),
                          Row(
                            children:
                            [
                              Slider(value: 0,
                                onChanged:(index){},
                                max: 100,
                                min: 0,
                                activeColor: Colors.blue,
                              ),
          
                              IconButton(onPressed: (){}, icon: Icon(IconBroken.Voice,color: Colors.blue,size: 35,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                [
          
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.blue[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Row(
                            children:
                            [
          
                              IconButton(onPressed: (){}, icon: Icon(IconBroken.Play,color: Colors.white,size: 35,)),
                              Slider(value: 0,
                                onChanged:(index){},
                                max: 100,
                                min: 0,
                                activeColor: Colors.green,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
                    radius: 15,
          
                  ),
                ],
              ),
              const SizedBox(height:20,),
              Row(
                children:
                [

                  CircleAvatar(
                    backgroundImage: NetworkImage('https://blog.bismart.com/hubfs/Imported_Blog_Media/los-10-mejores-bots-disponibles-en-Internet-Sep-26-2023-08-53-22-8616-AM.jpg#keepProtocol'),
                    radius: 15,

                  ),
                  SizedBox(width: 15,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('The verse is ',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [

                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('"الْحَمْدُ لِلَّهِ الَّذِي أَنزَلَ عَلَى عَبْدِهِ الْكِتَابَ"',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [

                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sheikh reader',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [

                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('عبدالباسط عبد الصمد ',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:5,),
              Row(
                children:
                [

                  SizedBox(width: 45,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Details of the verse',style: TextStyle(fontSize: 17),),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
