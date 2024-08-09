import 'package:flutter/material.dart';
import 'package:social/modules/social_bots_screens/bmi/bmi_screen.dart';
import 'package:social/modules/social_bots_screens/social_chat_bot_quran_screen.dart';
import 'package:social/shared/components/components.dart';
import '../../layout/news_app/news_layout.dart';
import '../social_bots_screens/id/id_home_screen.dart';
import '../social_bots_screens/image_to_text_bot_screen.dart';
import '../social_bots_screens/social_chat_bot_player_screen.dart';
import '../social_bots_screens/speech_to_text_bot_screen.dart';
import '../social_bots_screens/todo/tasks_to_do_screen.dart';
import '../social_bots_screens/text_to_speech_bot_screen.dart';

class BotsScreen extends StatelessWidget
{
  const BotsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20,
          shape:const  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(100),topLeft: Radius.circular(100)),),
          margin:const EdgeInsets.all(7),
          child:  Stack(
            alignment: Alignment.bottomLeft,
            children:
            [
              const Image(
                image: NetworkImage('https://www.kaspersky.com/content/en-global/images/repository/isc/2021/what_are_bots_image1_710x400px_300dpi.jpg',
                ),
                height: 170,
                width: double.infinity,
                fit:BoxFit.cover ,
              ),
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Text('Choose the assistant you want',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: 
              [
                buildPlayerBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildIDBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildToDoBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildNewsAppBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildImageToTextBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildSpeechToTextBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildBMIBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildTextToSpeechBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildQuranBotItem(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                buildFlagsBotItem(context),
              ],
            ),
          ),
        ),
    
      ],
    );
  }
}






Widget buildQuranBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
         navigatorTo(context, ChatBotScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://blog.bismart.com/hubfs/Imported_Blog_Media/los-10-mejores-bots-disponibles-en-Internet-Sep-26-2023-08-53-22-8616-AM.jpg#keepProtocol'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('Qur’an Guide ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                   SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Bomi, how can I help you?',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildPlayerBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
        navigatorTo(context, ChatPlayerBotScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/electric-guitar-with-neon-light-cyberpunk-style-by-generative-ai_919160-1209.jpg'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('Music Player',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Mimo, Log in to listen ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildBMIBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
        navigatorTo(context, BMIScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://technologyreview.ae/wp-content/uploads/2022/11/Iaremenko-Sergii.jpg'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('BMI Calculator',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Miro, Log in to Calculate ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildToDoBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
        navigatorTo(context, TasksToDoScreen());

       },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://st.depositphotos.com/22162388/51492/i/450/depositphotos_514926692-stock-photo-chat-bot-customer-service-automation.jpg'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('Tasks To Do ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Veno, Log in to Save Tasks ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildIDBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
         navigatorTo(context, IDHomeScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://www.idanalyzer.com/img/globalcover.jpg'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('National ID Analyst',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Anst, Log in to analyze your ID ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildFlagsBotItem(context)
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
            backgroundImage: NetworkImage('https://media.licdn.com/dms/image/D4E12AQHa1RNT9nzw4g/article-cover_image-shrink_720_1280/0/1669651099268?e=2147483647&v=beta&t=SIgId_QZI2mXQKXIJySmQmLjC0mtJVJjo8jHNba9pYE'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('Country Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Deto, Log in to show details ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildImageToTextBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
        navigatorTo(context, ImageToTextScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/h5UHVGzxvOCyQkcrl0TzWd2__AMlF6jRgQifnYDZpeSEByA2Os7P2rKlm8WjnNmrcnLF'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('Image Processes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Mego, Log in to show details ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildSpeechToTextBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
         navigatorTo(context, SpeechToTextScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://assets.bizclikmedia.net/668/64098dc1456d7393ebbcc050bdc79590:6872a7e51ea22ab43406d0f211ffa4a6/gettyimages-1068618284-jpg.webp'),
            radius: 30,

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
              Text('Hello, I\'m Tito, Log in to show details ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildTextToSpeechBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
         navigatorTo(context, TextToSpeechScreen());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.mos.cms.futurecdn.net/8KSwd8e4A9nB73nhsvHKGe.jpg'),
            radius: 30,

          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Text('Text To Speech',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                ],
              ),
              Text('Hello, I\'m Spe, Log in to show details ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildNewsAppBotItem(context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
        navigatorTo(context, const NewsLayout());
      },
      child:const  Row(
        children:
        [
          CircleAvatar(
            backgroundImage: NetworkImage('https://i0.wp.com/mediashift.org/wp-content/uploads/2017/12/news-apps.jpg?w=2000'),
            radius: 30,

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
              Text('Hello, I\'m New, Log in to show details ..',style: TextStyle(color:Colors.grey,fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}

