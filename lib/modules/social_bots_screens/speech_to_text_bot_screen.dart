import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextScreen extends StatefulWidget
{
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen>
{

  bool isListening =false;
  SpeechToText speechToText = SpeechToText();
  String text ='قم بالضغط علي الزر وابدا بالتحدث';
  List<String>? history =['',''] ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
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
              backgroundImage: NetworkImage('https://assets.bizclikmedia.net/668/64098dc1456d7393ebbcc050bdc79590:6872a7e51ea22ab43406d0f211ffa4a6/gettyimages-1068618284-jpg.webp'),
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
                    Text('Speech Recognition',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
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
      body: Container(
        width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.all(10),

          child: Column(
            children:
            [
              const Text('History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              Expanded(
                child: history.toString().isEmpty? Text('Your History Will Appear Here'):Scrollbar(
                  thumbVisibility: true,
                  controller: ScrollController(),
                  thickness: 3.0,
                  radius: Radius.circular(4.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ListView.separated(
                        itemBuilder: (context ,index)
                    {
                      return Text(history![index],textDirection: TextDirection.rtl,);
                    },
                        separatorBuilder: (context,index)
                    {
                      return const SizedBox(height: 10,);
                    },
                        itemCount: history!.length),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 140,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: ScrollController(),
                  thickness: 3.0,
                  radius: Radius.circular(4.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: SingleChildScrollView(
                      reverse: true,
                      controller: ScrollController(),
                      child: Text('"$text"',style:const  TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,

                      ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80,)
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        duration: const Duration(seconds: 1),
        glowColor: Colors.purpleAccent,
        repeat: true,

        child:GestureDetector(
          onTapDown: (details) async
          {
            if(!isListening)
              {
                var available = await speechToText.initialize();
            if(available)
              {
              setState(() {
              isListening = true;
              speechToText.listen(
                onResult: (result)
                {
                  setState(() {
                    text = result.recognizedWords;
                  });
                }
                );
              });
              }
                history?.add(text);

              }
          },
          onTapUp: (details)async
          {
            setState(() {
              isListening = false;
            });

            setState(() {
              speechToText.stop().then((value)
              {


              });
            });


          },
          child:  CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            radius: 35,
            child: !isListening? const Icon(Icons.mic_none,color: Colors.white,) : const Icon(Icons.mic,color: Colors.white,),

          ),
        ),

      ),

    );
  }
}