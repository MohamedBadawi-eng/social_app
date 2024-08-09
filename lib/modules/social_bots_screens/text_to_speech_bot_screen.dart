import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

class TextToSpeechScreen extends StatefulWidget
{
  const TextToSpeechScreen({super.key});

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen>
{
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
              backgroundImage: NetworkImage('https://cdn.mos.cms.futurecdn.net/8KSwd8e4A9nB73nhsvHKGe.jpg'),
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
                    Text('Text to Speech',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
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

    );
  }
}