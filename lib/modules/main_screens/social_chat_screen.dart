import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget
{
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder:(context,index)
                {
                  return buildStoryItme();
                },
                separatorBuilder: (context,index)
                {
                  return const SizedBox(width: 10,);
                },
                itemCount: 10,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context,index)
              {
                 return buildPersonChat();
              },
              separatorBuilder: (context,index)
              {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                );
              },
              itemCount: 10,
          ),
        ),
      ],
    );
  }
}

Widget buildPersonChat()
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {

      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
            radius: 30,
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text('Mohamed Badawi ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
              Text('Hello, I\'m Mohamed Badawi, ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildStoryItme()
{
  return Column(
    children:
    [
      Stack(

        children:
        [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.yellowAccent
            ),
            height: 72,
            width: 72,
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),

                ),
            ),
            height: 70,
            width: 70,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmGMptbHtRdqPXRMn6511OJWhmMBu340ikcg&s'),
            fit: BoxFit.cover,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 8,
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 7,
            ),
          ),

        ],
        alignment: Alignment.bottomRight,
      ),

      SizedBox(height: 7,),
      Text('Mohamed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
      Text('Badawi ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),

    ],
  );
}
// Widget buildChatItme()
// {
//   return null;
// }