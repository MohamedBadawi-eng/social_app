 import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget
{
  const ResultScreen(
      {super.key,
        required this.name,
        required this.date,
        required this.age,
        required this.horoscope,
        required this.governorate,
      });

  final String name;
  final String date;
  final String horoscope;
  final String age;
  final String governorate;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        children:
        [
          Stack(
            children:
            [
              Image.asset(
                'assets/images/backgraund_id.png',
                fit:BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              Column(
                children:
                [
                  const SizedBox(height: 20,),
                  // App Bar
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children:
                      [
                        IconButton(
                          onPressed:()
                          {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                            color: Color(0xffB4AD91) ,),

                        ),
                        const Expanded(
                          child:  Text(
                            'Result',
                            style: TextStyle(
                              color:Color(0xffF19755),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign:TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: ()
                          {
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(builder:(_)
                            //   {
                            //     return const ArchivedScreen();
                            //   }
                            //   ),
                            // );
                          },
                          icon:const Icon(
                            Icons.archive,
                            color: Color(0xffB4AD91),
                          ),

                        ),
                      ],
                    ),
                  ),

                  // Body
                  SizedBox(
                    height:MediaQuery.of(context).size.height-100,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left:35.0,right: 35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        [

                          const SizedBox(height: 20,),

                          // Data
                          Text(
                            "Welcome To My Humble Programme",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xffB4AD91),

                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 30.0,
                              color: Color(0xffF9ECB7),
                              shadows:
                              [
                                Shadow(color: Colors.black,offset: Offset(2, 2)),
                                Shadow(color: Colors.brown,offset: Offset(2, 2)),
                              ],

                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            date,
                            style:const TextStyle(
                              fontSize: 25.0,
                              color: Color(0xffF9ECB7),
                              shadows:
                              [
                                Shadow(color: Colors.black,offset: Offset(2, 2)),
                                Shadow(color: Colors.brown,offset: Offset(2, 2)),

                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Governorate is $governorate ',
                            style: const TextStyle(
                              fontSize: 25.0,
                              color: Color(0xffF9ECB7),
                              shadows:
                              [
                                Shadow(color: Colors.black,offset: Offset(2, 2)),
                                Shadow(color: Colors.brown,offset: Offset(2, 2)),

                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Horoscope is $horoscope',
                            style: const TextStyle(
                              fontSize: 30.0,
                              color: Color(0xffF9ECB7),
                              shadows:
                              [
                                Shadow(color: Colors.black,offset: Offset(2, 2)),
                                Shadow(color: Colors.brown,offset: Offset(2, 2)),

                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$age Years Old',
                            style: const TextStyle(
                              fontSize: 25.0,
                              color: Color(0xffF9ECB7),
                              shadows:
                              [
                                Shadow(color: Colors.black,offset: Offset(2, 2)),
                                Shadow(color: Colors.brown,offset: Offset(2, 2)),

                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                           Text(
                             "I Hope The Information Is Correct",
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Color(0xff9A4E53),

                             ),
                             textAlign: TextAlign.center,
                           ),

                          // Learn
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:
                            [
                              const Text(
                                "       Already have an ID?",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Color(0xffF9ECB7),
                                ),
                              ),
                              TextButton(
                                onPressed: ()
                                {
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(builder: (_)
                                  //   {
                                  //     return const LearnScreen();
                                  //   },
                                  //   ),
                                  // );
                                },
                                child: const Text(
                                  "Learn",
                                  style: TextStyle(fontSize: 11.0),
                                ),
                              ),
                            ],
                          ),

                          // Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              IconButton(
                                onPressed:()
                                {
                                  // launchUrl(Uri.parse('https://www.facebook.com/padawy.top'));
                                },
                                icon: const Icon(
                                  Icons.facebook,
                                  color: Color(0xff0377EB),
                                ),
                              ),
                              const SizedBox(width: 10.0,),
                              IconButton(
                                onPressed:()
                                {
                                  // launchUrl(Uri.parse('https://www.youtube.com/channel/UCQhq4qKzL1h4ahrSyK8gQ7Q'));
                                },
                                icon: const Icon(
                                  Icons.live_tv,
                                  color: Color(0xff9A4E53),
                                ),
                              ),
                              const SizedBox(width: 10.0,),
                              IconButton(
                                onPressed:()
                                {
                                  // launchUrl(Uri.parse('https://t.me/MohamedBadawii'));
                                },
                                icon: const Icon(
                                  Icons.telegram,
                                  color: Color(0xffF9ECB7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0,),

                          // Me
                          const Center(
                            child:  Text(
                              "Directed By Mohamed Badawi",
                              style: TextStyle(
                                  fontSize: 6,
                                  color: Colors.blueGrey
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],

          ),
        ],
      ),
    );
  }

}